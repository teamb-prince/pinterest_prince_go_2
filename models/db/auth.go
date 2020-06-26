package db

import (
	"github.com/dgrijalva/jwt-go"
)

type Token struct {
	TokenStr string
}

type TokenClaims struct {
	Role      string
	UserID    string
	CreatedAt int64
	Expire    int64
	jwt.StandardClaims
}

type ErrorMessage struct {
	Message string `json:"message"`
}

func (data SQLDataStorage) StoreToken(token *Token) error {

	query := `
	INSERT INTO token (id) 
	VALUES ($1)
	`
	arguments := []interface{}{
		token.TokenStr,
	}

	_, err := data.DB.Exec(
		query,
		arguments...,
	)
	if err != nil {
		return err
	}

	return nil
}
