package handlers

import (
	"errors"
	"image"
	_ "image/gif"
	_ "image/jpeg"
	_ "image/png"
	"mime/multipart"

	"net/http"
	"net/url"

	"github.com/PuerkitoBio/goquery"
	uuid "github.com/satori/go.uuid"
	"github.com/teamb-prince/pinterest_prince_go/api/awsmanager"
	"github.com/teamb-prince/pinterest_prince_go/logs"
)

const (
	// TODO あとで議論
	minImageSize = 200
)

var getTitleError = errors.New("Faild get title from url")
var getImageError = errors.New("Faild get image from url")
var uploadImageError = errors.New("Faild upload image (S3)")

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
	// defer res.Body.Close()

	var title string

	doc.Find("head").Each(func(i int, s *goquery.Selection) {
		title = s.Find("title").Text()
	})
	return title, nil

}

func GetImages(baseURL string, res *http.Response) ([]string, error) {

	doc, err := goquery.NewDocumentFromReader(res.Body)

	if err != nil {
		logs.Error("%v", err)
		return nil, getImageError
	}
	// defer res.Body.Close()

	var result []string = make([]string, 0)

	doc.Find("img").Each(func(_ int, s *goquery.Selection) {
		imageURL, _ := s.Attr("src")
		absImageURL := toAbsUrl(baseURL, imageURL)

		if absImageURL != "" {
			if GetImageSize(absImageURL) {
				result = append(result, absImageURL)
			}
		}
	})
	return result, nil
}

func UploadImage(s3 *awsmanager.S3Manager, file multipart.File, format string) (string, error) {

	filename := uuid.NewV4().String()

	// s3にあげる処理
	url, err := s3.Upload(file, filename, format)
	if err != nil {
		return "", uploadImageError
	}

	return url, err

}

func toAbsUrl(baseURLStr string, weburl string) string {
	baseurl, _ := url.Parse(baseURLStr)
	relurl, err := url.Parse(weburl)
	if relurl.Scheme != "" {
		return weburl
	}
	if err != nil {
		return ""
	}
	absurl := baseurl.ResolveReference(relurl)
	return absurl.String()
}
