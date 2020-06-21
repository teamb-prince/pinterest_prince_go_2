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

func TestServeTopic(t *testing.T) {
	const url = "http://localhost:8080"
	const endpoint = "/topics"
	var topic1 = topic1()
	var cases = []struct {
		Desc string
		Code int
		DB   mocks.SQLDataStoreMock
	}{
		{
			"single topic",
			200,
			mocks.SQLDataStoreMock{ExpectedTopics: []*db.Topic{topic1}},
		},
		{
			"multi topic",
			200,
			mocks.SQLDataStoreMock{ExpectedTopics: []*db.Topic{topic1, topic1}},
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
			// body := recorder.Body.Bytes()

			assert.Equal(t, c.Code, recorder.Code, "Status code should match reference")

		})
	}
}
