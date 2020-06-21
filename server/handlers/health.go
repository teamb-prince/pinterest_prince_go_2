package handlers

import (
	"net/http"

	"github.com/teamb-prince/pinterest_prince_go/logs"
)

func HealthHandler() func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		switch r.Method {
		case http.MethodGet:
			logs.Info("200 StatusOK")
			w.WriteHeader(http.StatusOK)
		case http.MethodPost:
			logs.Warn("405 Method Not Allowed")
			w.WriteHeader(http.StatusMethodNotAllowed)
		}
	}
}
