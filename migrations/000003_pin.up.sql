CREATE TABLE pin
(
    id         UUID PRIMARY KEY DEFAULT UUID_GENERATE_V4(),
    user_id TEXT references user_account(id),
    original_user_id TEXT references user_account(id),
    url      TEXT,
    title TEXT,
    image_url     TEXT,
    board_id UUID references board(id),
    description TEXT,
    created_at TIMESTAMP WITHOUT TIME ZONE
)