package view

import (
	"time"

	uuid "github.com/satori/go.uuid"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
)

type Board struct {
	ID          uuid.UUID  `json:"id"`
	UserID      string     `json:"user_id"`
	Name        string     `json:"name"`
	TopicID     uuid.UUID  `json:"topic_id"`
	Description string     `json:"description"`
	CreatedAt   *time.Time `json:"created_at"`
}

type BoardRequest struct {
	Name        string    `json:"name"`
	TopicID     uuid.UUID `json:"topic_id"`
	Description string    `json:"description"`
}

func NewBoard(board *db.Board) *Board {

	b := &Board{
		board.ID,
		board.UserID,
		board.Name,
		board.TopicID,
		board.Description,
		board.CreatedAt,
	}

	return b
}

func NewBoards(boards []*db.Board) []*Board {

	var result []*Board = make([]*Board, 0)
	for _, board := range boards {
		result = append(result, NewBoard(board))
	}

	return result
}
