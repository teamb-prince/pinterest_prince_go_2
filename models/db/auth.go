package db

type Token struct {
	TokenStr string `json:"token"`
}

type ErrorMessage struct {
	Message string `json:"message"`
}
