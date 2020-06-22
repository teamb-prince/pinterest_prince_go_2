package handlers

import (
	"encoding/json"
	"net/http"
	"strconv"
	"time"

	"github.com/gorilla/mux"
	uuid "github.com/satori/go.uuid"
	"github.com/teamb-prince/pinterest_prince_go/logs"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
	"github.com/teamb-prince/pinterest_prince_go/models/view"
)

func ServeBoard(data db.DataStorage) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		if r.Method != "GET" {
			logs.Warn("405 Method Not Allowed")
			w.WriteHeader(http.StatusMethodNotAllowed)
		}

		vars := mux.Vars(r)
		uuidStr := vars["id"]

		uuid, err := uuid.FromString(uuidStr)
		if err != nil {
			logs.Error("Request: %s, Invalid Board ID: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}

		board, err := data.GetBoard(uuid)
		if err != nil {

			if err.Error() == "IdNotFound" {
				logs.Error("Request: %s, Board ID Not Found: %v", RequestSummary(r), err)
				NotFound(w, r)
				return
			} else {
				logs.Error("Request: %s, Internal Server Error (DB ERROR): %v", RequestSummary(r), err)
				InternalServerError(w, r)
				return

			}
		}

		bytes, err := json.Marshal(view.NewBoard(board))
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

func ServeBoards(data db.DataStorage) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		if r.Method != "GET" {
			logs.Warn("405 Method Not Allowed")
			w.WriteHeader(http.StatusMethodNotAllowed)
		}

		qValues := r.URL.Query()
		userID := qValues.Get("user_id")
		topicID, _ := uuid.FromString(qValues.Get("topic_id"))
		limit, _ := strconv.Atoi(qValues.Get("limit"))
		offset, _ := strconv.Atoi(qValues.Get("offset"))

		boards, err := data.GetBoards(userID, topicID, limit, offset)
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

func CreateBoard(data db.DataStorage) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {

		requestBoard := &view.BoardRequest{}

		if err := json.NewDecoder(r.Body).Decode(requestBoard); err != nil {
			logs.Error("Request: %s, unable to parse content: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}

		now := time.Now()
		storedBoard := &db.Board{
			ID:          uuid.NewV4(),
			UserID:      requestBoard.UserID,
			Name:        requestBoard.Name,
			TopicID:     requestBoard.TopicID,
			Description: requestBoard.Description,
			CreatedAt:   &now,
		}

		if err := data.StoreBoard(storedBoard); err != nil {
			logs.Error("Request: %s, unable to store board: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		bytes, err := json.Marshal(view.NewBoard(storedBoard))
		if err != nil {
			logs.Error("Request: %s, serializing board: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		w.Header().Set(contentType, jsonContent)

		if _, err = w.Write(bytes); err != nil {
			logs.Error("Request: %s, writing response: %v", RequestSummary(r), err)
		}
	}
}

func DeleteBoard(data db.DataStorage) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		vars := mux.Vars(r)
		boardIDStr := vars["id"]

		boardID, err := uuid.FromString(boardIDStr)
		if err != nil {
			logs.Error("Request: %s, book id invalid: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}
		if err = data.DeleteBoard(boardID); err != nil {
			logs.Error("Request: %s, book doesn't exist in database: %v", RequestSummary(r), err)
			http.NotFound(w, r)
		}
	}
}
