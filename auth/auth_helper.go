package auth

import (
	"os"

	jwt "github.com/dgrijalva/jwt-go"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
	"golang.org/x/crypto/bcrypt"
)

func checkUserPassword(password string, hashedPassword string) error {
	return bcrypt.CompareHashAndPassword([]byte(hashedPassword), []byte(password))
}

func ParseToken(tokenString string) (*db.TokenClaims, error) {

	tokenClaims := &db.TokenClaims{}
	_, err := jwt.ParseWithClaims(tokenString, tokenClaims, func(token *jwt.Token) (interface{}, error) {
		return []byte(os.Getenv("SIGNINGKEY")), nil
	})
	if err != nil {
		return nil, err
	}
	return tokenClaims, nil
}

func CheckToken(tokenString string) (string, error) {

}

func TokenUser(tokenString string) (string, error) {
	claims, err := ParseToken(tokenString)
	if err != nil {
		return "", nil
	}

	userID := claims.UserID
	return userID, nil
}

func GetExpire(tokenString string) (int64, error) {
	claims, err := ParseToken(tokenString)
	if err != nil {
		return 0, nil
	}

	expire := claims.Expire
	return expire, nil
}
