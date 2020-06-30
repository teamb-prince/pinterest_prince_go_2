package mocks

import (
	uuid "github.com/satori/go.uuid"
	"github.com/teamb-prince/pinterest_prince_go/models/db"
)

type SQLDataStoreMock struct {
	ExpectedError  error
	ExpectedTopics []*db.Topic
	ExpectedPin    *db.Pin
	ExpectedPins   []*db.Pin
	ExpectedBoard  *db.Board
	ExpectedBoards []*db.Board
	ExpectedUser   *db.User
	ExpectedUsers  []*db.User
	ExpectedToken  *db.Token
}

func (db SQLDataStoreMock) GetTopics() ([]*db.Topic, error) {
	return db.ExpectedTopics, db.ExpectedError
}

func (db SQLDataStoreMock) DiscoverPins(limit int, offset int) ([]*db.Pin, error) {
	return db.ExpectedPins, db.ExpectedError
}

func (db SQLDataStoreMock) GetPins(userID string, boardID uuid.UUID, tag string, limit int, offset int) ([]*db.Pin, error) {
	return db.ExpectedPins, db.ExpectedError
}

func (db SQLDataStoreMock) GetPin(pinID uuid.UUID, userID string) (*db.Pin, error) {
	return db.ExpectedPin, db.ExpectedError
}

func (db SQLDataStoreMock) SavePin(pin *db.SavePin) error {
	return db.ExpectedError
}

func (db SQLDataStoreMock) StorePin(pin *db.Pin) error {
	return db.ExpectedError
}

func (db SQLDataStoreMock) GetBoard(boardID uuid.UUID) (*db.Board, error) {
	return db.ExpectedBoard, db.ExpectedError
}

func (db SQLDataStoreMock) GetBoards(userId string, topicId uuid.UUID, limit int, offset int) ([]*db.Board, error) {
	return db.ExpectedBoards, db.ExpectedError
}

func (db SQLDataStoreMock) StoreBoard(board *db.Board) error {
	return db.ExpectedError
}

func (db SQLDataStoreMock) DeleteBoard(boardID uuid.UUID) error {
	return db.ExpectedError
}

func (db SQLDataStoreMock) GetUser(userID string) (*db.User, error) {
	return db.ExpectedUser, db.ExpectedError
}

func (db SQLDataStoreMock) GetUsers(limit int, offset int) ([]*db.User, error) {
	return db.ExpectedUsers, db.ExpectedError
}

func (db SQLDataStoreMock) StoreUser(user *db.User) error {
	return db.ExpectedError
}

func (db SQLDataStoreMock) GetToken(token *db.Token) (*db.Token, error) {
	return db.ExpectedToken, db.ExpectedError
}

func (db SQLDataStoreMock) StoreToken(token *db.Token) error {
	return db.ExpectedError
}

func (db SQLDataStoreMock) DeleteToken(token *db.Token) error {
	return db.ExpectedError
}
