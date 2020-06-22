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

func TestServeBoard(t *testing.T) {
	const url = "http://localhost:8080"
	const endpoint = "/boards"
	var board = board1()
	var cases = []struct {
		Desc string
		Code int
		DB   mocks.SQLDataStoreMock
		ID   string
	}{
		{
			"single board",
			200,
			mocks.SQLDataStoreMock{ExpectedBoard: board},
			board.ID.String(),
		},
		{
			"wrong board id",
			400,
			mocks.SQLDataStoreMock{ExpectedBoard: board},
			"aaaaa",
		},
		{
			"board id not found",
			404,
			mocks.SQLDataStoreMock{ExpectedBoard: board, ExpectedError: errors.New("IdNotFound")},
			"be224aec-c6c0-415f-a92b-b451b12e6f4f",
		},
		{
			"db down",
			500,
			mocks.SQLDataStoreMock{ExpectedError: errors.New("")},
			board.ID.String(),
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

func TestServeBoards(t *testing.T) {
	const url = "http://localhost:8080"
	const endpoint = "/boards"
	var board = board1()
	var cases = []struct {
		Desc string
		Code int
		DB   mocks.SQLDataStoreMock
	}{
		{
			"single board",
			200,
			mocks.SQLDataStoreMock{ExpectedBoards: []*db.Board{board}},
		},
		{
			"multi board",
			200,
			mocks.SQLDataStoreMock{ExpectedBoards: []*db.Board{board, board}},
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
