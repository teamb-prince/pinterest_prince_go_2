CREATE TABLE token
(
    id         TEXT PRIMARY KEY,
    user_id TEXT references user_account(id),
    expire TIMESTAMP WITHOUT TIME ZONE NOT NULL
)