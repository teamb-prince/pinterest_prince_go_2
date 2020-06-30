package db

import (
	"database/sql"

	uuid "github.com/satori/go.uuid"
)

type DataStorage interface {
	GetTopics() ([]*Topic, error)
	GetPin(pinID uuid.UUID, userID string) (*Pin, error)
	DiscoverPins(limit int, offset int) ([]*Pin, error)
	GetPins(userID string, boardID uuid.UUID, tag string, limit int, offset int) ([]*Pin, error)
	StorePin(pin *Pin) error
	SavePin(pin *SavePin) error
	GetBoard(boardID uuid.UUID) (*Board, error)
	GetBoards(userId string, topicId uuid.UUID, limit int, offset int) ([]*Board, error)
	StoreBoard(board *Board) error
	DeleteBoard(boardID uuid.UUID) error
	GetUser(userID string) (*User, error)
	GetUsers(limit int, offset int) ([]*User, error)
	StoreUser(user *User) error
	GetToken(user *Token) (*Token, error)
	StoreToken(user *Token) error
	DeleteToken(user *Token) error
}

func NewSQLDataStorage(sqlDB *sql.DB) SQLDataStorage {
	return SQLDataStorage{DB: sqlDB}
}

type SQLDataStorage struct {
	DB *sql.DB
}
