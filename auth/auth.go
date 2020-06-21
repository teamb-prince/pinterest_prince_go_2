package auth

import (
	"net/http"
	"os"
	"time"

	jwtmiddleware "github.com/auth0/go-jwt-middleware"
	jwt "github.com/dgrijalva/jwt-go"
	"github.com/teamb-prince/pinterest_prince_go/logs"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
	"github.com/teamb-prince/pinterest_prince_go/server/handlers"
)

// GetTokenHandler get token
func GetToken(data db.DataStorage) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {

		// headerのセット
		token := jwt.New(jwt.SigningMethodHS256)

		// claimsのセット
		claims := token.Claims.(jwt.MapClaims)
		claims["admin"] = true
		claims["sub"] = "54546557354"
		claims["name"] = "taro"
		claims["iat"] = time.Now()
		claims["exp"] = time.Now().Add(time.Hour * 24).Unix()

		// 電子署名
		tokenString, _ := token.SignedString([]byte(os.Getenv("SIGNINGKEY")))

		// JWTを返却
		_, err := w.Write([]byte(tokenString))
		if err != nil {
			logs.Error("Request: %s, writing response: %v", handlers.RequestSummary(r), err)
			handlers.InternalServerError(w, r)
			return
		}

	}
}

// JwtMiddleware check token
var JwtMiddleware = jwtmiddleware.New(jwtmiddleware.Options{
	ValidationKeyGetter: func(token *jwt.Token) (interface{}, error) {
		return []byte(os.Getenv("SIGNINGKEY")), nil
	},
	SigningMethod: jwt.SigningMethodHS256,
})
