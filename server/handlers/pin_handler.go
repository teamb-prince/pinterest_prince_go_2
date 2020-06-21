package handlers

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strconv"
	"time"

	"github.com/gorilla/mux"
	uuid "github.com/satori/go.uuid"
	"github.com/teamb-prince/pinterest_prince_go/logs"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
	"github.com/teamb-prince/pinterest_prince_go/models/view"
)

func ServePins(data db.DataStorage) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {

		qValues := r.URL.Query()
		userID := qValues.Get("user_id")
		boardID, _ := uuid.FromString(qValues.Get("board_id"))
		limit, _ := strconv.Atoi(qValues.Get("limit"))
		offset, _ := strconv.Atoi(qValues.Get("offset"))

		pins, err := data.GetPins(userID, boardID, limit, offset)
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

		vars := mux.Vars(r)
		uuidStr := vars["id"]

		uuid, err := uuid.FromString(uuidStr)
		if err != nil {
			logs.Error("Request: %s, Invalid ID: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}

		pin, err := data.GetPin(uuid)
		if err != nil {

			if err.Error() == "IdNotFound" {
				fmt.Println(err)
				logs.Error("Request: %s, Pin ID Not Found: %v", RequestSummary(r), err)
				NotFound(w, r)
				return
			} else {
				fmt.Println(err)
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

func CreatePin(data db.DataStorage) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {

		requestPin := &view.PinRequest{}

		if err := json.NewDecoder(r.Body).Decode(requestPin); err != nil {
			logs.Error("Request: %s, unable to parse content: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}
		url := requestPin.URL

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

		now := time.Now()
		storedPin := &db.Pin{
			ID:             uuid.Nil,
			UserID:         requestPin.UserID,
			OriginalUserID: requestPin.OriginalUserID,
			URL:            requestPin.URL,
			Title:          requestPin.Title,
			ImageURL:       requestPin.ImageURL,
			BoardID:        requestPin.BoardID,
			Description:    requestPin.Description,
			CreatedAt:      &now,
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
