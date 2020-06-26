package middleware

import (
	"fmt"
	"net/http"

	"github.com/teamb-prince/pinterest_prince_go/auth"
	"github.com/teamb-prince/pinterest_prince_go/logs"
	"github.com/teamb-prince/pinterest_prince_go/server/handlers"
)

func RequireAuthorization(token string) func(http.Handler) http.Handler {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {

			tokenHeader := r.Header.Get("token")
			claims, err := auth.ParseToken(tokenHeader)
			if err != nil {
				logs.Error("Request: %s, unable to parse token: %v", handlers.RequestSummary(r), err)
				handlers.BadRequest(w, r)
				return
			}
			next.ServeHTTP(w, r)
			fmt.Println(claims)
		})
	}
}
