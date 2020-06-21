package handlers

import (
	"errors"
	"image"
	_ "image/gif"
	_ "image/jpeg"
	_ "image/png"

	"net/http"

	"github.com/PuerkitoBio/goquery"
	"github.com/teamb-prince/pinterest_prince_go/logs"
)

const (
	// TODO あとで議論
	minImageSize = 200
)

var getTitleError = errors.New("Faild get title from url")
var getImageError = errors.New("Faild get image from url")

func GetImageSize(imageUrl string) bool {

	resp, err := http.Get(imageUrl)
	if err != nil {
		logs.Error("%v", err)
		return false
	}
	defer resp.Body.Close()

	m, _, err := image.Decode(resp.Body)
	if err != nil {
		logs.Error("image: unknown format")
		return false
	}
	g := m.Bounds()

	height := g.Dy()
	width := g.Dx()

	return width >= minImageSize && height >= minImageSize
}

func GetTitle(res *http.Response) (string, error) {
	doc, err := goquery.NewDocumentFromReader(res.Body)
	if err != nil {
		logs.Error("%v", err)
		return "", getTitleError
	}
	defer res.Body.Close()

	var title string

	doc.Find("head").Each(func(i int, s *goquery.Selection) {
		title = s.Find("title").Text()
	})
	return title, nil

}

func GetImages(res *http.Response) ([]string, error) {
	doc, err := goquery.NewDocumentFromReader(res.Body)
	if err != nil {
		logs.Error("%v", err)
		return nil, getImageError
	}
	defer res.Body.Close()

	var result []string = make([]string, 0)

	doc.Find("img").Each(func(_ int, s *goquery.Selection) {
		imageUrl, _ := s.Attr("src")
		if imageUrl != "" {
			if GetImageSize(imageUrl) {
				result = append(result, imageUrl)
			}
		}
	})
	return result, nil
}
