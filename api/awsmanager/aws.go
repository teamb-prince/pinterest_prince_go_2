package awsmanager

import (
	"errors"
	"fmt"
	"io"
	"io/ioutil"
	"net/http"
	"os"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/awserr"
	"github.com/aws/aws-sdk-go/aws/credentials"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/rekognition"
	"github.com/aws/aws-sdk-go/service/s3"
	"github.com/aws/aws-sdk-go/service/s3/s3manager"
	"github.com/joho/godotenv"
	"github.com/teamb-prince/pinterest_prince_go/logs"
)

type AWSManager struct {
	Uploader        *s3manager.Uploader
	Downloader      *s3manager.Downloader
	Rekognition     *rekognition.Rekognition
	Bucket          string
	AccessKeyID     string
	SecretAccessKey string
	Region          string
	Keys            string
}

func (s *AWSManager) Init() (err error) {

	err = godotenv.Load("./aws.env")
	if err != nil {
		logs.Error("Error, Could not import aws access key.")
		return
	}

	s.Bucket = os.Getenv("AWS_BUCKET_NAME")
	s.AccessKeyID = os.Getenv("AWS_ACCESS_KEY_ID")
	s.SecretAccessKey = os.Getenv("AWS_SECRET_ACCESS_KEY_ID")
	s.Region = os.Getenv("AWS_REGION")
	s.Keys = "images"
	sess := session.Must(session.NewSessionWithOptions(session.Options{
		Config: aws.Config{
			Credentials: credentials.NewStaticCredentialsFromCreds(credentials.Value{
				AccessKeyID:     s.AccessKeyID,
				SecretAccessKey: s.SecretAccessKey,
			}),
			Region: aws.String(s.Region),
		},
	}))
	if err != nil {
		return
	}

	s.Uploader = s3manager.NewUploader(sess)
	s.Downloader = s3manager.NewDownloader(sess)
	s.Rekognition = rekognition.New(sess, aws.NewConfig().WithRegion(s.Region))

	return
}

func (s *AWSManager) Upload(buf io.Reader, fileName string, extension string, dirName string) (url string, err error) {

	if fileName == "" {
		return "", errors.New("fileName is required")
	}

	var contentType string

	switch extension {
	case "jpg":
		contentType = "image/jpeg"
	case "jpeg":
		contentType = "image/jpeg"
	case "gif":
		contentType = "image/gif"
	case "png":
		contentType = "image/png"
	default:
		return "", errors.New("this extension is invalid")
	}

	result, err := s.Uploader.Upload(&s3manager.UploadInput{
		ACL:         aws.String("public-read"),
		Body:        buf,
		Bucket:      aws.String(s.Bucket),
		ContentType: aws.String(contentType),
		Key:         aws.String(dirName + "/" + fileName),
	})

	if err != nil {
		return "", fmt.Errorf("failed to upload file, %v", err)
	}

	return result.Location, nil
}

func (s *AWSManager) Download(fileName string, dirName string) ([]byte, error) {
	buffer := aws.NewWriteAtBuffer([]byte{})

	_, err := s.Downloader.Download(buffer, &s3.GetObjectInput{
		Bucket: aws.String(s.Bucket),
		Key:    aws.String(dirName + "/" + fileName),
	})
	if err != nil {
		if err, ok := err.(awserr.Error); ok && err.Code() == "NoSuchKey" {
			return nil, nil
		}
		return nil, err
	}

	return buffer.Bytes(), nil

}

func NewAWSManager() *AWSManager {
	var am AWSManager
	_ = am.Init()
	return &am
}

func (am *AWSManager) Detect(url string) ([]string, error) {

	// 画像ファイルを取得
	image, err := http.Get(url)
	if err != nil {
		fmt.Println(err.Error())
		return nil, err
	}
	defer image.Body.Close()

	// 画像ファイルのデータを全て読み込み
	bytes, err := ioutil.ReadAll(image.Body)

	if err != nil {
		fmt.Println(err.Error())
		return nil, err
	}

	var maxLabels int64 = 3

	params := &rekognition.DetectLabelsInput{
		Image: &rekognition.Image{
			Bytes: bytes,
		},
		MaxLabels: &maxLabels,
	}

	output, err := am.Rekognition.DetectLabels(params)
	if err != nil {
		fmt.Println(err.Error())
		return nil, err
	}

	var labels []string

	for _, label := range output.Labels {
		labels = append(labels, *label.Name)
		//fmt.Printf("ラベル名:%s 信頼度:%f\n", *label.Name, *label.Confidence)
	}
	return labels, nil
}
