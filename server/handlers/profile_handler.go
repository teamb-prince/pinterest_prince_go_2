package handlers

import (
	"encoding/json"
	"net/http"

	uuid "github.com/satori/go.uuid"
	"github.com/teamb-prince/pinterest_prince_go/auth"
	"github.com/teamb-prince/pinterest_prince_go/logs"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
	"github.com/teamb-prince/pinterest_prince_go/models/view"
)

var (
	defaultBoardID = uuid.Nil
	defaultTopicID = uuid.Nil
	defaultTag     = ""
	defaultLimit   = 0
	defaultOffset  = 0
)

func ServeProfileUser(data db.DataStorage) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {

		tokenHeader := r.Header.Get("token")

		userID, err := auth.GetTokenUser(tokenHeader)
		if err != nil {
			logs.Error("Request: %s, unable to parse token: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}

		user, err := data.GetUser(userID)
		if err != nil {
			logs.Error("Request: %s, reading pins from database: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		bytes, err := json.Marshal(view.NewUserInfo(user))
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

func ServeProfilePins(data db.DataStorage) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {

		tokenHeader := r.Header.Get("token")

		userID, err := auth.GetTokenUser(tokenHeader)
		if err != nil {
			logs.Error("Request: %s, unable to parse token: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}

		pins, err := data.GetPins(userID, defaultBoardID, defaultTag, defaultLimit, defaultOffset)
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

func ServeProfileBoards(data db.DataStorage) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		tokenHeader := r.Header.Get("token")

		userID, err := auth.GetTokenUser(tokenHeader)
		if err != nil {
			logs.Error("Request: %s, unable to parse token: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}

		boards, err := data.GetBoards(userID, defaultTopicID, defaultLimit, defaultOffset)
		if err != nil {
			logs.Error("Request: %s, Internal Server Error (DB ERROR): %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		bytes, err := json.Marshal(view.NewBoards(boards))
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
