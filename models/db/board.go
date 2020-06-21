package db

import (
	"database/sql"
	"errors"
	"time"

	uuid "github.com/satori/go.uuid"
)

type Board struct {
	ID          uuid.UUID
	UserID      string
	Name        string
	TopicID     uuid.UUID
	Description string
	CreatedAt   *time.Time
}

func (data SQLDataStorage) GetBoard(boardID uuid.UUID) (*Board, error) {
	queryArgs := []interface{}{boardID.String()}

	query := (`
	SELECT b.id, b.user_id, b.name, b.topic_id, b.description, b.created_at
	FROM board b
	WHERE b.id = $1
	`)

	rows, err := data.DB.Query(query, queryArgs...)
	if err != nil {

		return nil, err
	}
	defer rows.Close()

	var board *Board

	for rows.Next() {
		board, err = boardFromRows(rows)
		if err != nil {
			return nil, err
		}
	}
	if board == nil {
		return nil, errors.New("IdNotFound")
	}

	if err = rows.Err(); err != nil {

		return nil, err
	}

	return board, nil
}

func (data SQLDataStorage) GetBoards(userID string, topicID uuid.UUID, limit int, offset int) ([]*Board, error) {

	if userID == "" {
		userID = "%"
	}
	if limit == 0 {
		limit = 100
	}

	var query string
	var queryArgs []interface{}

	if topicID == uuid.Nil {
		query = (`
		SELECT b.id, b.user_id, b.name, b.topic_id, b.description, b.created_at
		FROM board b
		WHERE b.user_id LIKE $1 
		ORDER BY b.created_at
		LIMIT $2
		OFFSET $3
		`)
		queryArgs = []interface{}{userID, limit, offset}
	} else {
		query = (`
		SELECT b.id, b.user_id, b.name, b.topic_id, b.description, b.created_at
		FROM board b
		WHERE b.user_id LIKE $1 AND b.topic_id LIKE $2
		ORDER BY b.created_at
		LIMIT $3
		OFFSET $4
		`)
		queryArgs = []interface{}{userID, topicID.String(), limit, offset}
	}

	rows, err := data.DB.Query(query, queryArgs...)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var boards []*Board = make([]*Board, 0)

	for rows.Next() {
		board, err := boardFromRows(rows)
		if err != nil {
			return nil, err
		}
		boards = append(boards, board)
	}

	return boards, nil
}

func (data SQLDataStorage) StoreBoard(board *Board) error {

	query := `
	INSERT INTO board (id, user_id, name, topic_id, description, created_at) 
	VALUES ($1, $2, $3, $4, $5, $6)
	RETURNING id
	`
	arguments := []interface{}{
		board.ID,
		board.UserID,
		board.Name,
		board.TopicID,
		board.Description,
		board.CreatedAt,
	}

	err := data.DB.QueryRow(
		query,
		arguments...,
	).Scan(&board.ID)
	if err != nil {
		return err
	}

	return nil
}

func (data SQLDataStorage) DeleteBoard(boardID uuid.UUID) error {
	const query = `
DELETE FROM board
WHERE id = $1;
`
	res, err := data.DB.Exec(query, boardID)
	if err != nil {
		return err
	}

	rowsAffected, err := res.RowsAffected()
	if err != nil {
		return err
	}

	if rowsAffected != 1 {
		return errors.New("BoardNotFound")
	}

	return nil
}

func boardFromRows(rows *sql.Rows) (*Board, error) {
	board := &Board{}
	err := rows.Scan(
		&board.ID,
		&board.UserID,
		&board.Name,
		&board.TopicID,
		&board.Description,
		&board.CreatedAt,
	)
	if err != nil {
		return nil, err
	}

	return board, nil
}
