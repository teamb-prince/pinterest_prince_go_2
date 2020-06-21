package view

import (
	uuid "github.com/satori/go.uuid"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
)

type Topic struct {
	ID   uuid.UUID `json:"id"`
	Name string    `json:"name"`
}

func NewTopic(topic *db.Topic) *Topic {

	t := &Topic{
		topic.ID,
		topic.Name,
	}

	return t
}

func NewTopics(topics []*db.Topic) []*Topic {
	t := make([]*Topic, 0, len(topics))

	for _, topic := range topics {
		t = append(t, NewTopic(topic))
	}

	return t
}
