package server

import (
	"bytes"
	"database/sql"
	"fmt"
	"image"
	"image/gif"
	"image/jpeg"
	"image/png"
	"io/ioutil"
	"log"
	"net/http"
	"os"

	"github.com/gorilla/mux"
	"github.com/teamb-prince/pinterest_prince_go/api/awsmanager"
	"github.com/teamb-prince/pinterest_prince_go/logs"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
	"github.com/teamb-prince/pinterest_prince_go/server/handlers"
	"golang.org/x/image/draw"
)

func Start(port int, dbConn *sql.DB) error {
	router := mux.NewRouter()
	data := db.NewSQLDataStorage(dbConn)
	s3manager := awsmanager.NewAWSManager()
	attachHandlers(router, data)
	middlewareAttachHandlers(router, data, *s3manager)

	s := &http.Server{
		Addr:    fmt.Sprintf(":%d", port),
		Handler: router,
	}
	logs.Info("Server started...")
	logs.Info("Listening on %s", s.Addr)

	// 魔界錬金術
	// dirwalk("./tmp_images", *s3manager)

	return s.ListenAndServe()

}

func attachHandlers(mux *mux.Router, data db.DataStorage) {
	mux.HandleFunc("/health", handlers.HealthHandler()).Methods(http.MethodGet)

	mux.HandleFunc("/topics", handlers.ServeTopics(data)).Methods(http.MethodGet)

	mux.HandleFunc("/pins/{id}", handlers.ServePin(data)).Methods(http.MethodGet)

	mux.HandleFunc("/pins", handlers.ServePins(data)).Methods(http.MethodGet)
	mux.HandleFunc("/pins/save", handlers.SavePin(data)).Methods(http.MethodPost)

	mux.HandleFunc("/discover", handlers.DiscoverPins(data)).Methods(http.MethodGet)

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
	mux.HandleFunc("/login", handlers.AuthenticateUser(data)).Methods(http.MethodPost)
	mux.HandleFunc("/logout", handlers.SignOut(data)).Methods(http.MethodPost)

	// [TODO] tokens
	// mux.HandleFunc("/tokens", handlers.DeleteTokens(data)).Methods(http.MethodDelete)

	mux.HandleFunc("/images/url-images", handlers.GetImage()).Methods(http.MethodPost)

}

func middlewareAttachHandlers(mux *mux.Router, data db.DataStorage, s3manager awsmanager.AWSManager) {

	mux.HandleFunc("/pins/local", handlers.CreatePinLocal(data, s3manager)).Methods(http.MethodPost)
	mux.HandleFunc("/pins/url", handlers.CreatePinURL(data, s3manager)).Methods(http.MethodPost)

	mux.HandleFunc("/profile/boards", handlers.ServeProfileBoards(data)).Methods(http.MethodGet)
	mux.HandleFunc("/profile/pins", handlers.ServeProfilePins(data)).Methods(http.MethodGet)
	mux.HandleFunc("/profile/user", handlers.ServeProfileUser(data)).Methods(http.MethodGet)

}

func dirwalk(dir string, s3 awsmanager.AWSManager) {
	files, err := ioutil.ReadDir(dir)
	if err != nil {
		panic(err)
	}

	for _, file := range files {
		file.Name()

		f, _ := os.Open(dir + "/" + file.Name())

		imgSrc, format, err := image.Decode(f)
		if err != nil {
			log.Fatalln(err)
			return
		}

		//rectange of image
		rctSrc := imgSrc.Bounds()

		size := 200
		//resize
		imgDst := image.NewRGBA(image.Rect(0, 0, size, int(size*rctSrc.Dy()/rctSrc.Dx())))
		draw.CatmullRom.Scale(imgDst, imgDst.Bounds(), imgSrc, rctSrc, draw.Over, nil)

		//create resized image file
		dst := new(bytes.Buffer)

		//encode resized image
		switch format {
		case "jpeg":
			if err := jpeg.Encode(dst, imgDst, &jpeg.Options{Quality: 100}); err != nil {
				fmt.Fprintln(os.Stderr, err)
				return
			}
		case "gif":
			if err := gif.Encode(dst, imgDst, nil); err != nil {
				fmt.Fprintln(os.Stderr, err)
				return
			}
		case "png":
			if err := png.Encode(dst, imgDst); err != nil {
				fmt.Fprintln(os.Stderr, err)
				return
			}
		default:
			fmt.Fprintln(os.Stderr, "format error")
			return
		}

		_, err = s3.Upload(dst, file.Name(), format, "thumb")
		if err != nil {
			return
		}
	}

	return
}
