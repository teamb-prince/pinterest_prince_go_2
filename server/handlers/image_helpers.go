package handlers

import (
	"bytes"
	"errors"
	"fmt"
	"image"
	"image/gif"
	"image/jpeg"
	"image/png"
	"io"
	"io/ioutil"
	"log"
	"os"

	"net/http"
	"net/url"

	"github.com/PuerkitoBio/goquery"
	uuid "github.com/satori/go.uuid"
	"github.com/teamb-prince/pinterest_prince_go/api/awsmanager"
	"github.com/teamb-prince/pinterest_prince_go/logs"
	"golang.org/x/image/draw"
)

const (
	minImageSize = 200
)

var getTitleError = errors.New("Failed get title from url")
var getImageError = errors.New("Failed get image from url")
var uploadImageError = errors.New("Failed upload image (S3)")

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

func UploadImage(s3 *awsmanager.AWSManager, buf io.Reader, format string) (string, error) {

	filename := uuid.NewV4().String()

	url, err := s3.Upload(buf, filename, format, "image")
	if err != nil {
		return "", uploadImageError
	}

	return url, err

}

func UploadThumbImageURL(s3 *awsmanager.AWSManager, url string) (string, error) {

	// 画像ファイルを取得
	res, err := http.Get(url)
	if err != nil {
		fmt.Println(err.Error())
		return "", err
	}
	defer res.Body.Close()

	// 画像ファイルのデータを全て読み込み
	resBytes, err := ioutil.ReadAll(res.Body)
	if err != nil {
		fmt.Println(err.Error())
		return "", err
	}

	imgSrc, format, err := image.Decode(bytes.NewReader(resBytes))
	if err != nil {
		log.Fatalln(err)
		return "", err
	}

	//rectange of image
	rctSrc := imgSrc.Bounds()

	size := 200
	//resize
	imgDst := image.NewRGBA(image.Rect(0, 0, size, int(size*rctSrc.Dy()/rctSrc.Dx())))
	draw.CatmullRom.Scale(imgDst, imgDst.Bounds(), imgSrc, rctSrc, draw.Over, nil)

	//create resized image file
	dst := new(bytes.Buffer)

	//encode resized image
	switch format {
	case "jpeg":
		if err := jpeg.Encode(dst, imgDst, &jpeg.Options{Quality: 100}); err != nil {
			fmt.Fprintln(os.Stderr, err)
			return "", err
		}
	case "gif":
		if err := gif.Encode(dst, imgDst, nil); err != nil {
			fmt.Fprintln(os.Stderr, err)
			return "", err
		}
	case "png":
		if err := png.Encode(dst, imgDst); err != nil {
			fmt.Fprintln(os.Stderr, err)
			return "", err
		}
	default:
		fmt.Fprintln(os.Stderr, "format error")
		return "", errors.New("format error")
	}

	filename := uuid.NewV4().String()

	resultURL, err := s3.Upload(dst, filename, format, "thumb")
	if err != nil {
		return "", uploadImageError
	}

	return resultURL, err

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
