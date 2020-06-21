package server

import (
	"bytes"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gorilla/mux"
	"github.com/stretchr/testify/assert"
	"github.com/teamb-prince/pinterest_prince_go/mocks"
)

func TestGetImage(t *testing.T) {
	const url = "http://localhost:8080"
	const endpoint = "/image"
	var cases = []struct {
		Desc   string
		Code   int
		InBody string
	}{
		{
			"invalid url",
			400,
			`{"url": "a"}`,
		},
		{
			"invalid json attribute",
			400,
			`{"urllll": "https://github.com/ariacat3366"}`,
		},
		{
			"URL Unauthoriezed",
			401,
			`{"url": "https://httpbin.org/status/401"}`,
		},
		{
			"URL Forbidden",
			403,
			`{"url": "https://httpbin.org/status/403"}`,
		},
		{
			"URL NotFound",
			404,
			`{"url": "https://httpbin.org/status/404"}`,
		},
		{
			"URL Conflict",
			409,
			`{"url": "https://httpbin.org/status/409"}`,
		},
		{
			"success",
			200,
			`{"url": "https://github.com/ariacat3366"}`,
		},
	}

	for _, c := range cases {
		t.Run(c.Desc, func(t *testing.T) {

			t.Logf("Testing %s", c.Desc)

			router := mux.NewRouter()
			data := mocks.SQLDataStoreMock{
				ExpectedPin: pin1()}
			attachHandlers(router, data)
			recorder := httptest.NewRecorder()
			jsonBytes := []byte(c.InBody)
			req := httptest.NewRequest(http.MethodPost, url+endpoint, bytes.NewBuffer(jsonBytes))

			router.ServeHTTP(recorder, req)

			assert.Equal(t, c.Code, recorder.Code, "Status code should match reference")

		})
	}
}
