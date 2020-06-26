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
	defaltBoardID = uuid.Nil
	defaltTopicID = uuid.Nil
	defaltLimit   = 0
	defaltOffset  = 0
)

func ServeProfilePins(data db.DataStorage) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {

		tokenHeader := r.Header.Get("token")

		userID, err := auth.CheckTokenUser(tokenHeader)
		if err != nil {
			logs.Error("Request: %s, unable to parse token: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}

		pins, err := data.GetPins(userID, defaltBoardID, defaltLimit, defaltOffset)
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

		userID, err := auth.CheckTokenUser(tokenHeader)
		if err != nil {
			logs.Error("Request: %s, unable to parse token: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}
		boards, err := data.GetBoards(userID, defaltTopicID, defaltLimit, defaltOffset)
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
