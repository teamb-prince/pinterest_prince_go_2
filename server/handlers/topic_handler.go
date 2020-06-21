package handlers

import (
	"encoding/json"
	"net/http"

	"github.com/teamb-prince/pinterest_prince_go/logs"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
	"github.com/teamb-prince/pinterest_prince_go/models/view"
)

func ServeTopics(data db.DataStorage) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {

		topics, err := data.GetTopics()
		if err != nil {
			logs.Error("Request: %s, reading topics from database: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		bytes, err := json.Marshal(view.NewTopics(topics))
		if err != nil {
			logs.Error("Request: %s, unable to parse content: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		w.Header().Set(contentType, jsonContent)

		if _, err = w.Write(bytes); err != nil {
			logs.Error("Request: %s, writing response: %v", RequestSummary(r), err)
		}
	}
}
