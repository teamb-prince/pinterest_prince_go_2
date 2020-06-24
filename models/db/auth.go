package db

type Token struct {
	TokenStr string
}

type ErrorMessage struct {
	Message string `json:"message"`
}

func (data SQLDataStorage) StoreToken(token *Token) error {

	query := `
	INSERT INTO token (id) 
	VALUES ($1)
	`
	arguments := []interface{}{
		token.TokenStr,
	}

	_, err := data.DB.Exec(
		query,
		arguments...,
	)
	if err != nil {
		return err
	}

	return nil
}
