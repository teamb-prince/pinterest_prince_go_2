package server

import (
	"time"

	uuid "github.com/satori/go.uuid"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
)

func pin1() *db.Pin {
	return &db.Pin{
		ID:          uuid.NewV4(),
		URL:         "URL",
		Title:       "Title",
		ImageURL:    "ImageURL",
		Description: "explaining something",
	}
}

func board1() *db.Board {
	time := time.Now()
	return &db.Board{
		ID:          uuid.NewV4(),
		UserID:      "user_id",
		Name:        "board_name",
		TopicID:     uuid.NewV4(),
		Description: "explaining something",
		CreatedAt:   &time,
	}
}

func topic1() *db.Topic {
	return &db.Topic{
		ID:   uuid.NewV4(),
		Name: "topic_name",
	}
}

func user1() *db.User {
	time := time.Now()
	return &db.User{
		ID:           "userID",
		FirstName:    "firstname",
		LastName:     "lastname",
		Email:        "a@example.com",
		PasswordHash: "hashhashhash~",
		Role:         "user",
		ProfileImage: "http://imagelink.com/a.jpg",
		Description:  "user 1 desuyo ~ ",
		Location:     "Tokyo",
		Web:          "http://webwebweb.com/user1",
		CreatedAt:    &time,
	}
}
