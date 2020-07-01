package view

import (
	"time"

	uuid "github.com/satori/go.uuid"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
)

type Pin struct {
	ID            uuid.UUID  `json:"id"`
	UserID        string     `json:"user_id"`
	URL           string     `json:"url"`
	Title         string     `json:"title"`
	ImageURL      string     `json:"image_url"`
	ThumbImageURL string     `json:"thumb_image_url"`
	Description   string     `json:"description"`
	UploadType    string     `json:"upload_type"`
	Label         string     `json:"label"`
	CreatedAt     *time.Time `json:"created_at"`
}

type PinRequest struct {
	URL         string    `json:"url"`
	ImageURL    string    `json:"image_url"`
	Title       string    `json:"title"`
	BoardID     uuid.UUID `json:"board_id"`
	Description string    `json:"description"`
}

type SavePinRequest struct {
	ID      uuid.UUID `json:"id"`
	UserID  string    `json:"user_id"`
	BoardID uuid.UUID `json:"board_id"`
}

func NewPin(pin *db.Pin) *Pin {

	p := &Pin{
		pin.ID,
		pin.UserID,
		pin.URL,
		pin.Title,
		pin.ImageURL,
		pin.ThumbImageURL,
		pin.Description,
		pin.UploadType,
		pin.Label,
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
