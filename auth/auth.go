package auth

import (
	"errors"
	"os"
	"time"

	jwt "github.com/dgrijalva/jwt-go"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
)

var StoreTokenErr = errors.New("Failed to store token")

// var UserExistsErr = errors.New("email already exists in the database")
var UnauthorizedErr = errors.New("Request Unauthorized")
var InvalidTokenErr = errors.New("Given token is invalid")

func generateToken(user *db.User) (*db.Token, error) {

	jwtToken := jwt.New(jwt.SigningMethodHS256)

	claims := jwtToken.Claims.(jwt.MapClaims)

	claims["Role"] = user.Role
	claims["UserID"] = user.ID
	claims["CreatedAt"] = time.Now().Unix()
	claims["Expire"] = time.Now().Add(time.Hour * 24).Unix()

	tokenString, err := jwtToken.SignedString([]byte(os.Getenv("SIGNINGKEY")))
	if err != nil {
		return nil, err
	}

	token := &db.Token{TokenStr: tokenString}

	return token, nil
}

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
