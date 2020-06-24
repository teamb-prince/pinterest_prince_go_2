package handlers

import (
	"encoding/json"
	"net/http"

	"github.com/teamb-prince/pinterest_prince_go/auth"
	"github.com/teamb-prince/pinterest_prince_go/logs"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
	"github.com/teamb-prince/pinterest_prince_go/models/view"
)

func AuthenticateUser(data db.DataStorage) func(http.ResponseWriter, *http.Request) {

	return func(w http.ResponseWriter, r *http.Request) {

		requestAuth := &view.RequestAuth{}

		if err := json.NewDecoder(r.Body).Decode(requestAuth); err != nil {
			logs.Error("Request: %s, unable to parse content: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}

		userID := requestAuth.ID
		password := requestAuth.Password

		token, err := auth.AuthenticateUser(data, userID, password)
		if err == auth.InvalidTokenErr || err == auth.UnauthorizedErr {
			logs.Error("Request: %s, unauthorized : %v", RequestSummary(r), err)
			Unauthorized(w, r)
			return
		} else if err != nil {
			logs.Error("Request: %s, unable to authentication: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		bytes, err := json.Marshal(view.NewToken(token))
		if err != nil {
			logs.Error("Request: %s, serializing user: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		w.Header().Set(contentType, jsonContent)

		if _, err = w.Write(bytes); err != nil {
			logs.Error("Request: %s, writing response: %v", RequestSummary(r), err)
			InternalServerError(w, r)
		}
	}
}
