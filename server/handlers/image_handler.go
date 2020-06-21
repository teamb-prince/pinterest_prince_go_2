package handlers

import (
	"encoding/json"
	"fmt"
	"image"
	"net/http"

	uuid "github.com/satori/go.uuid"
	"github.com/teamb-prince/pinterest_prince_go/api/awsmanager"
	"github.com/teamb-prince/pinterest_prince_go/logs"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
	"github.com/teamb-prince/pinterest_prince_go/models/view"
)

func GetImage() func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		if r.Method != "POST" {
			logs.Warn("405 Method Not Allowed")
			w.WriteHeader(http.StatusMethodNotAllowed)
		}

		imageInfo := &db.ImageInfo{}

		err := json.NewDecoder(r.Body).Decode(imageInfo)
		if err != nil {
			logs.Error("Request: %s, unable to parse content: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}

		url := imageInfo.URL

		// TODO 適切なディレクトリ構成にする

		res, err := http.Get(url)
		if err != nil {
			logs.Error("%v", err)
			BadRequest(w, r)
			return
		}

		defer res.Body.Close()

		if res.StatusCode != 200 {
			logs.Error("Status Code: %d %s\n", res.StatusCode, res.Status)
			HttpErrorHandler(res.StatusCode, w, r)
			return
		}

		images, err := GetImages(res)
		if err != nil {
			logs.Error("%v", err)
			InternalServerError(w, r)
			return
		}

		title, err := GetTitle(res)
		if err != nil {
			logs.Error("%v", err)
			InternalServerError(w, r)
			return
		}

		resJson := view.Images{
			OriginalURL: url,
			ImageURL:    images,
			Title:       title,
		}

		bytes, err := json.Marshal(resJson)
		if err != nil {
			logs.Error("Request: %s, unable to parse content: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		w.Header().Set(contentType, jsonContent)
		_, err = w.Write(bytes)
		if err != nil {
			logs.Error("Request: %s, writing response: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}
	}
}

func UploadImage(s3 *awsmanager.S3Manager) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		file, _, err := r.FormFile("image")
		if err != nil {
			http.Error(w, err.Error(), http.StatusBadRequest)
			return
		}
		defer file.Close()
		_, format, err := image.DecodeConfig(file)
		if err != nil {
			// 画像フォーマットではない場合はエラーが発生する
			http.Error(w, err.Error(), http.StatusBadRequest)
			return
		}
		fmt.Println(format)
		/*
			img, _, err := image.Decode(file)
			if err != nil {
				w.WriteHeader(http.StatusBadRequest)
				return
			}*/

		filename := uuid.NewV4().String()

		// s3にあげる処理
		url, err := s3.Upload(file, filename, format)
		if err != nil {
			http.Error(w, err.Error(), http.StatusBadRequest)
			return
		}

		s3Image := view.S3Image{URL: url}

		bytes, err := json.Marshal(s3Image)
		if err != nil {
			logs.Error("Request: %s, unable to parse content: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		w.Header().Set(contentType, jsonContent)
		_, err = w.Write(bytes)
		if err != nil {
			logs.Error("Request: %s, writing response: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}
	}
}
