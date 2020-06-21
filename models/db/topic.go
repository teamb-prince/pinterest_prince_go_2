package db

import (
	uuid "github.com/satori/go.uuid"
)

type Topic struct {
	ID   uuid.UUID
	Name string
}

// [TODO] クエリを受け取れるようにするか議論（今は全部返してる　個人的にはいらない）
func (data SQLDataStorage) GetTopics() ([]*Topic, error) {

	query := "SELECT id, name FROM topic"

	rows, err := data.DB.Query(query)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var topics []*Topic
	for rows.Next() {
		var topic Topic
		err := rows.Scan(&topic.ID, &topic.Name)
		if err != nil {
			return nil, err
		}

		topics = append(topics, &topic)
	}

	err = rows.Err()
	if err != nil {
		return nil, err
	}

	return topics, nil
}
