package handlers

import (
	"encoding/json"
	"net/http"
	"strconv"
	"time"

	"github.com/gorilla/mux"
	"github.com/teamb-prince/pinterest_prince_go/logs"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
	"github.com/teamb-prince/pinterest_prince_go/models/view"
)

const (
	defaultRole         = "user"
	defaultProfileImage = "https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/original.jpg"
)

func ServeUsers(data db.DataStorage) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		if r.Method != "GET" {
			logs.Warn("405 Method Not Allowed")
			w.WriteHeader(http.StatusMethodNotAllowed)
		}

		qValues := r.URL.Query()
		limit, _ := strconv.Atoi(qValues.Get("limit"))
		offset, _ := strconv.Atoi(qValues.Get("offset"))

		users, err := data.GetUsers(limit, offset)
		if err != nil {
			logs.Error("Request: %s, Internal Server Error (DB error): %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		bytes, err := json.Marshal(view.NewUsers(users))
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

func ServeUsersInfo(data db.DataStorage) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		if r.Method != "GET" {
			logs.Warn("405 Method Not Allowed")
			w.WriteHeader(http.StatusMethodNotAllowed)
		}

		qValues := r.URL.Query()
		limit, _ := strconv.Atoi(qValues.Get("limit"))
		offset, _ := strconv.Atoi(qValues.Get("offset"))

		users, err := data.GetUsers(limit, offset)
		if err != nil {
			logs.Error("Request: %s, Internal Server Error (DB error): %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		bytes, err := json.Marshal(view.NewUsersInfo(users))
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

func ServeUserInfo(data db.DataStorage) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		if r.Method != "GET" {
			logs.Warn("405 Method Not Allowed")
			w.WriteHeader(http.StatusMethodNotAllowed)
		}

		vars := mux.Vars(r)
		userID := vars["id"]

		user, err := data.GetUser(userID)
		if err != nil {
			if err.Error() == "IdNotFound" {
				logs.Error("Request: %s, User ID Not Found: %v", RequestSummary(r), err)
				NotFound(w, r)
				return
			} else {
				logs.Error("Request: %s, Internal Server Error (DB error): %v", RequestSummary(r), err)
				InternalServerError(w, r)
				return

			}
		}

		bytes, err := json.Marshal(view.NewUserInfo(user))
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

func ServeUser(data db.DataStorage) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		if r.Method != "GET" {
			logs.Warn("405 Method Not Allowed")
			w.WriteHeader(http.StatusMethodNotAllowed)
		}

		vars := mux.Vars(r)
		userID := vars["id"]

		user, err := data.GetUser(userID)
		if err != nil {

			if err.Error() == "IdNotFound" {
				logs.Error("Request: %s, User ID Not Found: %v", RequestSummary(r), err)
				NotFound(w, r)
				return
			} else {
				logs.Error("Request: %s, Internal Server Error (DB error): %v", RequestSummary(r), err)
				InternalServerError(w, r)
				return

			}
		}

		bytes, err := json.Marshal(view.NewUser(user))
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

func CreateUser(data db.DataStorage) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {

		requestUser := &view.RequestUser{}

		if err := json.NewDecoder(r.Body).Decode(requestUser); err != nil {
			logs.Error("Request: %s, unable to parse content: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}

		hashedPassword, err := HashPassword(requestUser.Password)
		if err != nil {
			logs.Error("Request: %s, unable to hash password: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		err = CheckUserValidation(requestUser.ID, requestUser.Password)
		if err != nil {
			if err == PasswordValidationErr {
				logs.Error("Request: %s, password validation error: %v", RequestSummary(r), err)
				BadRequest(w, r)
				return
			} else if err == UserIDValidationErr {
				logs.Error("Request: %s, user id validation error: %v", RequestSummary(r), err)
				BadRequest(w, r)
				return
			} else {
				logs.Error("Request: %s, : internal server error %v", RequestSummary(r), err)
				InternalServerError(w, r)
				return
			}
		}

		err = CheckUserExist(data, requestUser.ID)
		if err != nil {
			if err == AlreadyExistErr {
				logs.Error("Request: %s, user id already exists: %v", RequestSummary(r), err)
				Forbidden(w, r)
				return
			} else {
				logs.Error("Request: %s, : internal server error %v", RequestSummary(r), err)
				InternalServerError(w, r)
				return
			}
		}

		now := time.Now()

		storedUser := &db.User{
			ID:           requestUser.ID,
			FirstName:    requestUser.ID,
			Email:        requestUser.Email,
			PasswordHash: hashedPassword,
			Role:         defaultRole,
			ProfileImage: defaultProfileImage,
			CreatedAt:    &now,
		}

		if err := data.StoreUser(storedUser); err != nil {
			logs.Error("Request: %s, unable to store user: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		bytes, err := json.Marshal(view.NewUser(storedUser))
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
