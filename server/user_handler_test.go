package server

import (
	"errors"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gorilla/mux"
	"github.com/stretchr/testify/assert"
	"github.com/teamb-prince/pinterest_prince_go/mocks"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
)

func TestServeUser(t *testing.T) {
	const url = "http://localhost:8080"
	const endpoint = "/users"
	var user1 = user1()
	var cases = []struct {
		Desc string
		Code int
		DB   mocks.SQLDataStoreMock
		ID   string
	}{
		{
			"single topic",
			200,
			mocks.SQLDataStoreMock{ExpectedUser: user1},
			user1.ID,
		},
		{
			"wrong ID",
			200,
			mocks.SQLDataStoreMock{ExpectedUser: user1},
			"aaaa",
		},
		{
			"db down",
			500,
			mocks.SQLDataStoreMock{ExpectedError: errors.New("")},
			user1.ID,
		},
	}

	for _, c := range cases {
		t.Run(c.Desc, func(t *testing.T) {

			t.Logf("Testing %s", c.Desc)

			router := mux.NewRouter()
			attachHandlers(router, c.DB)
			recorder := httptest.NewRecorder()
			req := httptest.NewRequest(http.MethodGet, url+endpoint+"/"+c.ID, nil)

			router.ServeHTTP(recorder, req)

			assert.Equal(t, c.Code, recorder.Code, "Status code should match reference")

		})
	}
}

func TestServeUsers(t *testing.T) {
	const url = "http://localhost:8080"
	const endpoint = "/users"
	var user = user1()
	var cases = []struct {
		Desc string
		Code int
		DB   mocks.SQLDataStoreMock
	}{
		{
			"single board",
			200,
			mocks.SQLDataStoreMock{ExpectedUsers: []*db.User{user}},
		},
		{
			"multi board",
			200,
			mocks.SQLDataStoreMock{ExpectedUsers: []*db.User{user, user}},
		},
		{
			"db down",
			500,
			mocks.SQLDataStoreMock{ExpectedError: errors.New("")},
		},
	}

	for _, c := range cases {
		t.Run(c.Desc, func(t *testing.T) {

			t.Logf("Testing %s", c.Desc)

			router := mux.NewRouter()
			attachHandlers(router, c.DB)
			recorder := httptest.NewRecorder()
			req := httptest.NewRequest(http.MethodGet, url+endpoint, nil)

			router.ServeHTTP(recorder, req)

			assert.Equal(t, c.Code, recorder.Code, "Status code should match reference")

		})
	}
}
