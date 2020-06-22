package view

type Images struct {
	OriginalURL string   `json:"url"`
	ImageURL    []string `json:"image_url"`
	Title       string   `json:"title"`
	Description string   `json:"description"`
}

type S3Image struct {
	URL string `json:"url"`
	// ThumbnailURL string `json:"thumbnail_url"`
}
