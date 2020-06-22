package handlers

import (
	"encoding/json"
	"net/http"

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

		if res.StatusCode != 200 {
			logs.Error("Status Code: %d %s\n", res.StatusCode, res.Status)
			HttpErrorHandler(res.StatusCode, w, r)
			return
		}

		metadata := GetMetadata(res.Body)

		title := metadata.Title
		description := metadata.Description

		images, err := GetImages(url, res)
		if err != nil {
			logs.Error("%v", err)
			InternalServerError(w, r)
			return
		}

		resJson := view.Images{
			OriginalURL: url,
			ImageURL:    images,
			Title:       title,
			Description: description,
		}

		bytes, err := json.Marshal(resJson)
		if err != nil {
			logs.Error("Request: %s, unable to parse content: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		defer res.Body.Close()

		w.Header().Set(contentType, jsonContent)
		_, err = w.Write(bytes)
		if err != nil {
			logs.Error("Request: %s, writing response: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}
	}
}
