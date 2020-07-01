package handlers

import (
	"bytes"
	"encoding/json"
	"image"
	"io"
	"net/http"
	"strconv"
	"strings"
	"time"

	"github.com/gorilla/mux"
	uuid "github.com/satori/go.uuid"
	"github.com/teamb-prince/pinterest_prince_go/api/awsmanager"
	"github.com/teamb-prince/pinterest_prince_go/auth"
	"github.com/teamb-prince/pinterest_prince_go/logs"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
	"github.com/teamb-prince/pinterest_prince_go/models/view"
)

func ServePins(data db.DataStorage) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {

		qValues := r.URL.Query()
		userID := qValues.Get("user_id")
		boardID, _ := uuid.FromString(qValues.Get("board_id"))
		label := qValues.Get("label")
		limit, _ := strconv.Atoi(qValues.Get("limit"))
		offset, _ := strconv.Atoi(qValues.Get("offset"))

		pins, err := data.GetPins(userID, boardID, label, limit, offset)
		if err != nil {
			logs.Error("Request: %s, reading pins from database: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		bytes, err := json.Marshal(view.NewPins(pins))
		if err != nil {
			logs.Error("Request: %s, Serialize Error: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		w.Header().Set(contentType, jsonContent)

		if _, err = w.Write(bytes); err != nil {
			logs.Error("Request: %s, writing response: %v", RequestSummary(r), err)
		}
	}
}

func DiscoverPins(data db.DataStorage) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {

		qValues := r.URL.Query()
		limit, _ := strconv.Atoi(qValues.Get("limit"))
		offset, _ := strconv.Atoi(qValues.Get("offset"))

		pins, err := data.DiscoverPins(limit, offset)
		if err != nil {
			logs.Error("Request: %s, reading pins from database: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		bytes, err := json.Marshal(view.NewPins(pins))
		if err != nil {
			logs.Error("Request: %s, Serialize Error: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		w.Header().Set(contentType, jsonContent)

		if _, err = w.Write(bytes); err != nil {
			logs.Error("Request: %s, writing response: %v", RequestSummary(r), err)
		}
	}
}

func ServePin(data db.DataStorage) func(http.ResponseWriter, *http.Request) {

	return func(w http.ResponseWriter, r *http.Request) {

		if r.Method != "GET" {
			logs.Warn("405 Method Not Allowed")
			w.WriteHeader(http.StatusMethodNotAllowed)
		}

		qValues := r.URL.Query()
		userID := qValues.Get("user_id")

		vars := mux.Vars(r)
		uuidStr := vars["id"]

		uuid, err := uuid.FromString(uuidStr)
		if err != nil {
			logs.Error("Request: %s, Invalid ID: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}

		pin, err := data.GetPin(uuid, userID)
		if err != nil {

			if err.Error() == "IdNotFound" {
				logs.Error("Request: %s, Pin ID Not Found: %v", RequestSummary(r), err)
				NotFound(w, r)
				return
			} else {
				logs.Error("Request: %s, Internal Server Error (DB Error): %v", RequestSummary(r), err)
				InternalServerError(w, r)
				return

			}
		}

		bytes, err := json.Marshal(view.NewPin(pin))
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

func CreatePinURL(data db.DataStorage, s3 awsmanager.AWSManager) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {

		tokenHeader := r.Header.Get("token")

		exist, err := auth.CheckToken(data, tokenHeader)
		if !exist {
			logs.Error("Request: %s, user does not exist: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}

		userID, err := auth.GetTokenUser(tokenHeader)
		if err != nil {
			logs.Error("Request: %s, unable to parse token: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}

		requestPin := &view.PinRequest{}

		if err := json.NewDecoder(r.Body).Decode(requestPin); err != nil {
			logs.Error("Request: %s, unable to parse content: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}
		url := requestPin.URL

		boardID := requestPin.BoardID

		err = CheckBoardOwner(data, userID, boardID)
		if err == db.IDNotFoundErr {
			logs.Error("Request: %s, board not found: %v", RequestSummary(r), err)
			NotFound(w, r)
			return
		} else if err == ForbiddenBoardErr {
			logs.Error("Request: %s, forbidden board: %v", RequestSummary(r), err)
			Forbidden(w, r)
			return
		} else if err != nil {
			logs.Error("Request: %s, unable to check board owner: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		res, err := http.Get(url)
		if err != nil {
			logs.Error("%v", err)
			BadRequest(w, r)
			return
		}
		if res.StatusCode != 200 {
			logs.Error("status code error: %d %s\n", res.StatusCode, res.Status)
			HttpErrorHandler(res.StatusCode, w, r)
			return
		}
		defer res.Body.Close()

		var labels []string

		labels, err = s3.Detect(requestPin.ImageURL)
		if err != nil {
			logs.Error("Request: %s, unable to detect images: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		label := labels[0]

		response, err := http.Get(requestPin.ImageURL)
		if err != nil {
			panic(err)
		}
		defer response.Body.Close()

		thumbImageURL, err := UploadThumbImageURL(&s3, requestPin.ImageURL)

		uploadType := "url"
		now := time.Now()
		storedPin := &db.Pin{
			ID:            uuid.Nil,
			UserID:        userID,
			URL:           requestPin.URL,
			Title:         requestPin.Title,
			ImageURL:      requestPin.ImageURL,
			ThumbImageURL: thumbImageURL,
			Description:   requestPin.Description,
			UploadType:    uploadType,
			BoardID:       boardID,
			Label:         label,
			CreatedAt:     &now,
		}

		if err := data.StorePin(storedPin); err != nil {
			logs.Error("Request: %s, unable to store pin: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		bytes, err := json.Marshal(view.NewPin(storedPin))
		if err != nil {
			logs.Error("Request: %s, serializing pin: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		w.Header().Set(contentType, jsonContent)

		if _, err = w.Write(bytes); err != nil {
			logs.Error("Request: %s, writing response: %v", RequestSummary(r), err)
		}
	}
}

func CreatePinLocal(data db.DataStorage, s3 awsmanager.AWSManager) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {

		tokenHeader := r.Header.Get("token")

		exist, err := auth.CheckToken(data, tokenHeader)
		if !exist {
			logs.Error("Request: %s, user does not exist: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}

		userID, err := auth.GetTokenUser(tokenHeader)
		if err != nil {
			logs.Error("Request: %s, unable to parse token: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}

		requestPin := &view.PinRequest{}

		reqJson := r.FormValue("json")

		if err := json.NewDecoder(strings.NewReader(reqJson)).Decode(requestPin); err != nil {
			logs.Error("Request: %s, unable to parse content: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}
		url := requestPin.URL

		boardID := requestPin.BoardID

		err = CheckBoardOwner(data, userID, boardID)
		if err == db.IDNotFoundErr {
			logs.Error("Request: %s, board not found: %v", RequestSummary(r), err)
			NotFound(w, r)
			return
		} else if err == ForbiddenBoardErr {
			logs.Error("Request: %s, forbidden board: %v", RequestSummary(r), err)
			Forbidden(w, r)
			return
		} else if err != nil {
			logs.Error("Request: %s, unable to check board owner: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		file, _, err := r.FormFile("image")
		if err != nil {
			logs.Error("Request: %s, unable to FormFile (image): %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}
		defer file.Close()

		buf1 := new(bytes.Buffer)
		buf2 := new(bytes.Buffer)
		writer := io.MultiWriter(buf1, buf2)
		io.Copy(writer, file)

		_, format, err := image.DecodeConfig(buf1)
		if err != nil {
			logs.Error("Request: %s, Invalid format: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}

		s3URL, err := UploadImage(&s3, buf2, format)
		if err != nil {
			logs.Error("Request: %s, unable to upload images: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		if url != "" {
			res, err := http.Get(url)
			if err != nil {
				logs.Error("%v", err)
				BadRequest(w, r)
				return
			}
			if res.StatusCode != 200 {
				logs.Error("status code error: %d %s\n", res.StatusCode, res.Status)
				HttpErrorHandler(res.StatusCode, w, r)
				return
			}
			defer res.Body.Close()
		}

		var labels []string

		if format == "png" || format == "jpeg" {
			labels, err = s3.Detect(s3URL)
			if err != nil {
				logs.Error("Request: %s, unable to detect images: %v", RequestSummary(r), err)
				InternalServerError(w, r)
				return
			}
		}

		label := labels[0]

		thumbImageURL, err := UploadThumbImageURL(&s3, s3URL)
		if err != nil {
			logs.Error("Request: %s, unable to upload images: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		uploadType := "local"
		now := time.Now()
		storedPin := &db.Pin{
			ID:            uuid.Nil,
			UserID:        userID,
			URL:           url,
			Title:         requestPin.Title,
			ImageURL:      s3URL,
			ThumbImageURL: thumbImageURL,
			Description:   requestPin.Description,
			UploadType:    uploadType,
			BoardID:       boardID,
			Label:         label,
			CreatedAt:     &now,
		}

		if err := data.StorePin(storedPin); err != nil {
			logs.Error("Request: %s, unable to store pin: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		bytes, err := json.Marshal(view.NewPin(storedPin))
		if err != nil {
			logs.Error("Request: %s, serializing pin: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		w.Header().Set(contentType, jsonContent)

		if _, err = w.Write(bytes); err != nil {
			logs.Error("Request: %s, writing response: %v", RequestSummary(r), err)
		}
	}
}

func SavePin(data db.DataStorage) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {

		tokenHeader := r.Header.Get("token")

		exist, err := auth.CheckToken(data, tokenHeader)
		if !exist {
			logs.Error("Request: %s, user does not exist: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}

		userID, err := auth.GetTokenUser(tokenHeader)
		if err != nil {
			logs.Error("Request: %s, unable to parse token: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}

		requestSavePin := &view.SavePinRequest{}

		if err := json.NewDecoder(r.Body).Decode(requestSavePin); err != nil {
			logs.Error("Request: %s, unable to parse content: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}

		pinID := requestSavePin.ID
		boardID := requestSavePin.BoardID

		err = CheckPinExist(data, pinID, userID)
		if err != nil {
			if err == AlreadyExistErr {
				logs.Error("Request: %s, pin already exists: %v", RequestSummary(r), err)
				Forbidden(w, r)
				return
			} else {
				logs.Error("Request: %s, : internal server error %v", RequestSummary(r), err)
				InternalServerError(w, r)
				return
			}
		}

		err = CheckBoardOwner(data, userID, boardID)
		if err == db.IDNotFoundErr {
			logs.Error("Request: %s, board not found: %v", RequestSummary(r), err)
			NotFound(w, r)
			return
		} else if err == ForbiddenBoardErr {
			logs.Error("Request: %s, forbidden board: %v", RequestSummary(r), err)
			Forbidden(w, r)
			return
		} else if err != nil {
			logs.Error("Request: %s, unable to check board owner: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		savePin := &db.SavePin{PinID: pinID, BoardID: boardID}

		if err := data.SavePin(savePin); err != nil {
			logs.Error("Request: %s, unable to store pin: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

	}
}
