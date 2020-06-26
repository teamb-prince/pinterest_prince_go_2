package view

import (
	"time"

	"github.com/teamb-prince/pinterest_prince_go/models/db"
)

type RequestAuth struct {
	ID       string `json:"id"`
	Password string `json:"password"`
}

type Token struct {
	TokenStr string `json:"token"`
}

type TokenClaims struct {
	Role      string     `json:"role"`
	UserID    string     `json:"user_id"`
	CreatedAt *time.Time `json:"created_at"`
	Expire    *time.Time `json:"expire"`
}

func NewTokenClaims(claims *db.TokenClaims) *TokenClaims {

	t := &TokenClaims{
		claims.Role,
		claims.UserID,
		unixToTime(claims.CreatedAt),
		unixToTime(claims.Expire),
	}

	return t
}

func NewToken(token *db.Token) *Token {

	t := &Token{
		token.TokenStr,
	}

	return t
}

func unixToTime(unix int64) *time.Time {
	tm := time.Unix(unix, 0)
	return &tm
}
