package db

import (
	"database/sql"
	"errors"

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

func (data SQLDataStorage) GetToken(token *Token) (*Token, error) {

	query := `
	SELECT *
	FROM token
	WHERE id = $1
	`
	arguments := []interface{}{
		token.TokenStr,
	}

	rows, err := data.DB.Query(query, arguments...)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var returnToken *Token

	for rows.Next() {
		returnToken, err = tokenFromRows(rows)
		if err != nil {
			return nil, err
		}
	}
	if returnToken == nil {
		return nil, errors.New("IdNotFound")
	}

	if err = rows.Err(); err != nil {

		return nil, err
	}

	return returnToken, nil

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

func (data SQLDataStorage) DeleteToken(token *Token) error {

	query := `
	DELETE FROM token 
	WHERE id = $1
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

func tokenFromRows(rows *sql.Rows) (*Token, error) {
	token := &Token{}
	err := rows.Scan(
		&token.TokenStr,
	)
	if err != nil {
		return nil, err
	}

	return token, nil
}
