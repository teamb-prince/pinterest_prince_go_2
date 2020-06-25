package view

import (
	"time"

	uuid "github.com/satori/go.uuid"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
)

type Pin struct {
	ID             uuid.UUID  `json:"id"`
	OriginalID     uuid.UUID  `json:"original_id"`
	UserID         string     `json:"user_id"`
	OriginalUserID string     `json:"original_user_id"`
	URL            string     `json:"url"`
	Title          string     `json:"title"`
	ImageURL       string     `json:"image_url"`
	BoardID        uuid.UUID  `json:"board_id"`
	Description    string     `json:"description"`
	UploadType     string     `json:"upload_type"`
	CreatedAt      *time.Time `json:"created_at"`
}

type PinRequest struct {
	URL            string    `json:"url"`
	UserID         string    `json:"user_id"`
	OriginalUserID string    `json:"original_user_id"`
	ImageURL       string    `json:"image_url"`
	Title          string    `json:"title"`
	BoardID        uuid.UUID `json:"board_id"`
	Description    string    `json:"description"`
}

func NewPin(pin *db.Pin) *Pin {

	p := &Pin{
		pin.ID,
		uuid.Nil, //pin.OriginalID,
		pin.UserID,
		"", //pin.OriginalUserID,
		pin.URL,
		pin.Title,
		pin.ImageURL,
		uuid.Nil, //pin.BoardID,
		pin.Description,
		pin.UploadType,
		pin.CreatedAt,
	}

	return p
}

func NewPins(pins []*db.Pin) []*Pin {
	p := make([]*Pin, 0, len(pins))

	for _, pin := range pins {
		p = append(p, NewPin(pin))
	}

	return p
}
