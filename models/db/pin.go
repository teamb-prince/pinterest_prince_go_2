package db

import (
	"database/sql"
	"errors"
	"time"

	uuid "github.com/satori/go.uuid"
)

type Pin struct {
	ID          uuid.UUID
	UserID      string
	URL         string
	Title       string
	ImageURL    string
	Description string
	UploadType  string
	BoardID     uuid.UUID
	CreatedAt   *time.Time
}

func (data SQLDataStorage) DiscoverPins(limit int, offset int) ([]*Pin, error) {

	if limit == 0 {
		limit = 100
	}

	var query string
	var queryArgs []interface{}

	query = (`
		SELECT p.id, p.user_id, p.url, p.title, p.image_url, p.description, p.upload_type, p.created_at
		FROM pin p
		ORDER BY RANDOM()
		LIMIT $1
		OFFSET $2
		`)

	queryArgs = []interface{}{limit, offset}

	rows, err := data.DB.Query(query, queryArgs...)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var pins []*Pin = make([]*Pin, 0)
	for rows.Next() {
		var pin Pin
		err := rows.Scan(&pin.ID, &pin.UserID, &pin.URL, &pin.Title, &pin.ImageURL, &pin.Description, &pin.UploadType, &pin.CreatedAt)
		if err != nil {
			return nil, err
		}

		pins = append(pins, &pin)
	}

	err = rows.Err()
	if err != nil {
		return nil, err
	}

	return pins, nil
}

func (data SQLDataStorage) GetPins(userID string, boardID uuid.UUID, limit int, offset int) ([]*Pin, error) {

	if userID == "" {
		userID = "%"
	}
	if limit == 0 {
		limit = 100
	}

	var query string
	var queryArgs []interface{}

	if boardID == uuid.Nil {
		query = (`
		SELECT p.id, p.user_id, p.url, p.title, p.image_url, p.description, p.upload_type, p.created_at
		FROM pin p, pin_board pb, board b
		WHERE b.user_id LIKE $1
		AND b.id = pb.board_id AND p.id = pb.pin_id
		ORDER BY p.created_at
		LIMIT $2
		OFFSET $3
		`)
		queryArgs = []interface{}{userID, limit, offset}
	} else {
		query = (`
		SELECT p.id, p.user_id, p.url, p.title, p.image_url, p.description, p.upload_type, p.created_at
		FROM pin p, pin_board pb, board b
		WHERE b.user_id LIKE $1 AND pb.board_id = $2 
		AND b.user_id LIKE $1
		AND b.id = pb.board_id AND p.id = pb.pin_id
		ORDER BY p.created_at
		LIMIT $3
		OFFSET $4
		`)
		queryArgs = []interface{}{userID, boardID.String(), limit, offset}
	}

	rows, err := data.DB.Query(query, queryArgs...)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var pins []*Pin = make([]*Pin, 0)
	for rows.Next() {
		var pin Pin
		err := rows.Scan(&pin.ID, &pin.UserID, &pin.URL, &pin.Title, &pin.ImageURL, &pin.Description, &pin.UploadType, &pin.CreatedAt)
		if err != nil {
			return nil, err
		}

		pins = append(pins, &pin)
	}

	err = rows.Err()
	if err != nil {
		return nil, err
	}

	return pins, nil
}

func (data SQLDataStorage) GetPin(pinID uuid.UUID, userID string) (*Pin, error) {
	var query string
	var queryArgs []interface{}

	if userID == "" {
		query = (`
		SELECT p.id, p.user_id, p.url, p.title, p.image_url, p.description, p.upload_type, p.created_at
		FROM pin p
		WHERE p.id = $1
		`)
		queryArgs = []interface{}{pinID.String()}
	} else {
		query = (`
		SELECT p.id, p.user_id, p.url, p.title, p.image_url, p.description, p.upload_type, p.created_at
		FROM pin p, pin_board pb, board b
		WHERE p.id = $1 AND b.user_id like $2
		AND p.id = pb.pin_id AND b.id = pb.board_id
		`)
		queryArgs = []interface{}{pinID.String(), userID}
	}

	rows, err := data.DB.Query(query, queryArgs...)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var pin *Pin

	for rows.Next() {
		pin, err = pinFromRows(rows)
		if err != nil {
			return nil, err
		}
	}
	if pin == nil {
		return nil, errors.New("IdNotFound")
	}

	if err = rows.Err(); err != nil {

		return nil, err
	}

	return pin, nil
}

func pinFromRows(rows *sql.Rows) (*Pin, error) {
	pin := &Pin{}
	err := rows.Scan(
		&pin.ID,
		&pin.UserID,
		&pin.URL,
		&pin.Title,
		&pin.ImageURL,
		&pin.Description,
		&pin.UploadType,
		&pin.CreatedAt,
	)
	if err != nil {
		return nil, err
	}
	return pin, nil
}

func (data SQLDataStorage) StorePin(pin *Pin) error {

	var query1 = `
		INSERT INTO pin (user_id, url, title, image_url, description, upload_type, created_at) 
		VALUES ($1, $2, $3, $4, $5, $6, $7)
		RETURNING id
		`
	var arguments1 = []interface{}{
		pin.UserID,
		pin.URL,
		pin.Title,
		pin.ImageURL,
		pin.Description,
		pin.UploadType,
		pin.CreatedAt,
	}

	err := data.DB.QueryRow(
		query1,
		arguments1...,
	).Scan(&pin.ID)
	if err != nil {
		return err
	}

	var query2 = `
		INSERT INTO pin_board (pin_id, board_id) 
		VALUES ($1, $2)
		`
	var arguments2 = []interface{}{
		pin.ID,
		pin.BoardID,
	}

	_, err = data.DB.Exec(
		query2,
		arguments2...,
	)
	if err != nil {
		return err
	}

	return nil
}
