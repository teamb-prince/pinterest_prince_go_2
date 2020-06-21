package aws

import (
	"bytes"
	"fmt"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/awserr"
	"github.com/aws/aws-sdk-go/aws/credentials"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/s3"
	"github.com/aws/aws-sdk-go/service/s3/s3manager"
	"github.com/joho/godotenv"
)

type S3Manager struct {
	Bucket     string
	Uploader   *s3manager.Uploader
	Downloader *s3manager.Downloader
}

func (s *S3Manager) Init() (err error) {

	s.Bucket = "bucket-pinterest-001" // バケット名
	err = godotenv.Load("../aws.env")
	if err != nil {
		fmt.Println("Error, Could not import aws access key.")
		return
	}
	creds := credentials.NewStaticCredentials("AWS_ACCESS_KEY", "AWS_SECRET_ACCESS_KEY", "")
	sess, err := session.NewSession(&aws.Config{
		Credentials: creds,
		Region:      aws.String("ap-northeast-1")},
	)
	if err != nil {
		return
	}

	s.Uploader = s3manager.NewUploader(sess)
	s.Downloader = s3manager.NewDownloader(sess)

	return
}

func (s *S3Manager) Upload(key string, body []byte) (err error) {
	params := &s3manager.UploadInput{
		Bucket: aws.String(s.Bucket),
		Key:    aws.String(key),
		Body:   bytes.NewReader(body),
	}

	_, err = s.Uploader.Upload(params)

	return nil
}

func (s *S3Manager) Download(key string) ([]byte, error) {
	buffer := aws.NewWriteAtBuffer([]byte{})

	_, err := s.Downloader.Download(buffer, &s3.GetObjectInput{
		Bucket: aws.String(s.Bucket),
		Key:    aws.String(key),
	})
	if err != nil {
		if err, ok := err.(awserr.Error); ok && err.Code() == "NoSuchKey" {
			return nil, nil
		}
		return nil, err
	}

	return buffer.Bytes(), nil

}

func NewS3Manager() {
	s3 S3Manager
}