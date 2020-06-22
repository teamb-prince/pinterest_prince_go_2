package server

import (
	"database/sql"
	"fmt"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/teamb-prince/pinterest_prince_go/api/awsmanager"
	"github.com/teamb-prince/pinterest_prince_go/logs"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
	"github.com/teamb-prince/pinterest_prince_go/server/handlers"
)

func Start(port int, dbConn *sql.DB) error {
	router := mux.NewRouter()
	data := db.NewSQLDataStorage(dbConn)
	s3manager := awsmanager.NewS3Manager()
	attachHandlers(router, data)
	awsAttachHandlers(router, data, *s3manager)

	s := &http.Server{
		Addr:    fmt.Sprintf(":%d", port),
		Handler: router,
	}
	logs.Info("Server started...")
	logs.Info("Listening on %s", s.Addr)
	return s.ListenAndServe()

}

// [TODO] JWT認証を導入する
func attachHandlers(mux *mux.Router, data db.DataStorage) {
	mux.HandleFunc("/health", handlers.HealthHandler()).Methods(http.MethodGet)

	mux.HandleFunc("/topics", handlers.ServeTopics(data)).Methods(http.MethodGet)

	mux.HandleFunc("/pins/{id}", handlers.ServePin(data)).Methods(http.MethodGet)

	mux.HandleFunc("/pins", handlers.ServePins(data)).Methods(http.MethodGet)

	mux.HandleFunc("/boards/{id}", handlers.ServeBoard(data)).Methods(http.MethodGet)
	// [TODO] board
	// mux.HandleFunc("/boards/{id}", handlers.UpdateBoard(data)).Methods(http.MethodPut)
	mux.HandleFunc("/boards/{id}", handlers.DeleteBoard(data)).Methods(http.MethodDelete)

	mux.HandleFunc("/boards", handlers.ServeBoards(data)).Methods(http.MethodGet)
	mux.HandleFunc("/boards", handlers.CreateBoard(data)).Methods(http.MethodPost)

	mux.HandleFunc("/users/{id}", handlers.ServeUser(data)).Methods(http.MethodGet)
	// mux.HandleFunc("/users/{id}", handlers.UpdateUser(data)).Methods(http.MethodPut)
	// mux.HandleFunc("/users/{id}", handlers.DeleteUser(data)).Methods(http.MethodDelete)
	mux.HandleFunc("/users/{id}/info", handlers.ServeUserInfo(data)).Methods(http.MethodGet)

	mux.HandleFunc("/users", handlers.ServeUsers(data)).Methods(http.MethodGet)
	mux.HandleFunc("/users", handlers.CreateUser(data)).Methods(http.MethodPost)
	// mux.HandleFunc("/users/info", handlers.ServeUsersInfo(data)).Methods(http.MethodGet)

	// [TODO] Auth
	// mux.HandleFunc("/auth/register", handlers.RegisterUser(data, al)).Methods(http.MethodPost)
	// mux.HandleFunc("/login", handlers.AuthenticateUser(data, al)).Methods(http.MethodPost)
	// mux.HandleFunc("/logout", handlers.SignOut(al)).Methods(http.MethodPost)

	// [TODO] tokens
	// mux.HandleFunc("/tokens", handlers.DeleteTokens(data)).Methods(http.MethodDelete)

	mux.HandleFunc("/images/url-images", handlers.GetImage()).Methods(http.MethodPost)

}

func awsAttachHandlers(mux *mux.Router, data db.DataStorage, s3manager awsmanager.S3Manager) {
	mux.HandleFunc("/pins/local", handlers.CreatePinLocal(data, s3manager)).Methods(http.MethodPost)
	mux.HandleFunc("/pins/url", handlers.CreatePinURL(data, s3manager)).Methods(http.MethodPost)
	// mux.HandleFunc("/images/resize", handlers.ResizeImage(s3manager)).Methods("POST")
}
