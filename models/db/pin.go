package db

import (
	"database/sql"
	"errors"
	"time"

	uuid "github.com/satori/go.uuid"
)

type Pin struct {
	ID             uuid.UUID
	OriginalID     uuid.UUID
	UserID         string
	OriginalUserID string
	URL            string
	Title          string
	ImageURL       string
	BoardID        uuid.UUID
	Description    string
	UploadType     string
	CreatedAt      *time.Time
}

func (data SQLDataStorage) DiscoverPins(limit int, offset int) ([]*Pin, error) {

	if limit == 0 {
		limit = 100
	}

	var query string
	var queryArgs []interface{}

	query = (`
		SELECT p.id, p.original_id, p.user_id, p.original_user_id, p.url, p.title, p.image_url, p.board_id, p.description, p.upload_type, p.created_at
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
		err := rows.Scan(&pin.ID, &pin.OriginalID, &pin.UserID, &pin.OriginalUserID, &pin.URL, &pin.Title, &pin.ImageURL, &pin.BoardID, &pin.Description, &pin.UploadType, &pin.CreatedAt)
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
		SELECT p.id, p.original_id, p.user_id, p.original_user_id, p.url, p.title, p.image_url, p.board_id, p.description, p.upload_type, p.created_at
		FROM pin p
		WHERE p.user_id LIKE $1
		ORDER BY p.created_at
		LIMIT $2
		OFFSET $3
		`)
		queryArgs = []interface{}{userID, limit, offset}
	} else {
		query = (`
		SELECT p.id, p.original_id, p.user_id, p.original_user_id, p.url, p.title, p.image_url, p.board_id, p.description, p.upload_type, p.created_at
		FROM pin p
		WHERE p.user_id LIKE $1 AND p.board_id = $2
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
		err := rows.Scan(&pin.ID, &pin.OriginalID, &pin.UserID, &pin.OriginalUserID, &pin.URL, &pin.Title, &pin.ImageURL, &pin.BoardID, &pin.Description, &pin.UploadType, &pin.CreatedAt)
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

func (data SQLDataStorage) GetPin(pinID uuid.UUID) (*Pin, error) {
	queryArgs := []interface{}{pinID.String()}

	query := (`
	SELECT p.id, p.original_id, p.user_id, p.original_user_id, p.url, p.title, p.image_url, p.board_id, p.description, p.upload_type, p.created_at
	FROM pin p
	WHERE p.id = $1
	`)

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
		&pin.OriginalID,
		&pin.UserID,
		&pin.OriginalUserID,
		&pin.URL,
		&pin.Title,
		&pin.ImageURL,
		&pin.BoardID,
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
	var query string
	var arguments []interface{}

	query = `
		INSERT INTO pin (user_id, original_user_id, url, title, image_url, board_id, description, upload_type, created_at) 
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
		RETURNING id
		`
	arguments = []interface{}{
		pin.UserID,
		pin.OriginalUserID,
		pin.URL,
		pin.Title,
		pin.ImageURL,
		pin.BoardID,
		pin.Description,
		pin.UploadType,
		pin.CreatedAt,
	}

	err := data.DB.QueryRow(
		query,
		arguments...,
	).Scan(&pin.ID)
	if err != nil {
		return err
	}

	// [TODO] original_idをidと同じものに更新する処理
	var queryUpdateOriginalID = `
		UPDATE pin 
		SET original_id = $1
		WHERE id = $1
		`
	arguments = []interface{}{
		pin.ID,
	}

	_, err = data.DB.Exec(
		queryUpdateOriginalID,
		arguments...,
	)
	if err != nil {
		return err
	}

	pin.OriginalID = pin.ID
	return nil
}
