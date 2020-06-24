package auth

import (
	"errors"
	"os"
	"time"

	jwtmiddleware "github.com/auth0/go-jwt-middleware"
	jwt "github.com/dgrijalva/jwt-go"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
	"golang.org/x/crypto/bcrypt"
)

var StoreTokenErr = errors.New("Faild to store token")

// var UserExistsErr = errors.New("email already exists in the database")
var UnauthorizedErr = errors.New("Request Unauthorized")
var InvalidTokenErr = errors.New("Given token is invalid")

func generateToken(user *db.User) (*db.Token, error) {

	jwtToken := jwt.New(jwt.SigningMethodHS256)

	claims := jwtToken.Claims.(jwt.MapClaims)

	claims["role"] = user.Role
	claims["sub"] = user.ID
	claims["iat"] = time.Now()
	claims["exp"] = time.Now().Add(time.Hour).Unix()

	tokenString, err := jwtToken.SignedString([]byte(os.Getenv("SIGNINGKEY")))
	if err != nil {
		return nil, err
	}

	token := &db.Token{TokenStr: tokenString}

	return token, nil
}

var JwtMiddleware = jwtmiddleware.New(jwtmiddleware.Options{
	ValidationKeyGetter: func(token *jwt.Token) (interface{}, error) {
		return []byte(os.Getenv("SIGNINGKEY")), nil
	},
	SigningMethod: jwt.SigningMethodHS256,
})

func AuthenticateUser(data db.DataStorage, userID string, password string) (*db.Token, error) {
	user, err := data.GetUser(userID)
	if err == db.IDNotFoundErr {
		return nil, UnauthorizedErr
	}
	if err != nil {
		return nil, err
	}

	passwordCheckError := checkUserPassword(password, user.PasswordHash)
	if passwordCheckError != nil {
		return nil, UnauthorizedErr
	}

	token, err := generateToken(user)
	if err != nil {
		return nil, err
	}

	err = data.StoreToken(token)
	if err != nil {
		return nil, StoreTokenErr
	}

	return token, nil
}

func checkUserPassword(password string, hashedPassword string) error {
	return bcrypt.CompareHashAndPassword([]byte(hashedPassword), []byte(password))
}
