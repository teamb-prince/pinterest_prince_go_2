package view

import "github.com/teamb-prince/pinterest_prince_go/models/db"

type RequestAuth struct {
	ID       string `json:"id"`
	Password string `json:"password"`
}

type Token struct {
	TokenStr string `json:"token"`
}

func NewToken(token *db.Token) *Token {

	t := &Token{
		token.TokenStr,
	}

	return t
}
