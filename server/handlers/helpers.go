package handlers

import (
	"errors"
	"fmt"
	"net/http"

	uuid "github.com/satori/go.uuid"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
	"golang.org/x/crypto/bcrypt"
)

type FieldValidationRes struct {
	ErrType string `json:"error_type"`
	Field   string `json:"field"`
}

const (
	contentType = "Content-Type"
	jsonContent = "application/json"
)

var ForbiddenBoardErr = errors.New("Forbidden Board")
var AlreadyExistErr = errors.New("Pin Already Exist")

func RequestSummary(r *http.Request) string {
	return fmt.Sprintf("%v %v", r.Method, r.URL)
}

func BadRequest(w http.ResponseWriter, r *http.Request) {
	http.Error(w, "400 bad request", http.StatusBadRequest)
}
func Unauthorized(w http.ResponseWriter, r *http.Request) {
	http.Error(w, "401 unauthorized", http.StatusUnauthorized)
}

func Forbidden(w http.ResponseWriter, r *http.Request) {
	http.Error(w, "403 forbidden", http.StatusForbidden)
}

func Conflict(w http.ResponseWriter, r *http.Request) {
	http.Error(w, "409 conflict", http.StatusConflict)
}

func InternalServerError(w http.ResponseWriter, r *http.Request) {
	http.Error(w, "500 internal server error", http.StatusInternalServerError)
}

func NotFound(w http.ResponseWriter, r *http.Request) {
	http.Error(w, "404 Not Found", http.StatusNotFound)
}

func HttpErrorHandler(statusCode int, w http.ResponseWriter, r *http.Request) {
	if statusCode == 403 {
		Forbidden(w, r)
	} else if statusCode == 400 {
		BadRequest(w, r)
	} else if statusCode == 404 {
		NotFound(w, r)
	} else if statusCode == 401 {
		Unauthorized(w, r)
	} else if statusCode == 409 {
		Conflict(w, r)
	} else {
		InternalServerError(w, r)
	}
}

func HashPassword(password string) (string, error) {
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
	return string(hashedPassword), err
}

func CheckBoardOwner(data db.DataStorage, userID string, boardID uuid.UUID) error {
	board, err := data.GetBoard(boardID)
	if err != nil {
		return err
	}

	if board.UserID != userID {
		return ForbiddenBoardErr
	}
	return nil
}

func CheckPinExist(data db.DataStorage, pinID uuid.UUID, userID string) error {
	_, err := data.GetPin(pinID, userID)
	if err == db.IDNotFoundErr {
		return nil
	} else if err == nil {
		return AlreadyExistErr
	}
	return err
}
