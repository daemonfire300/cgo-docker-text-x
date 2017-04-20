package main

import (
	"io/ioutil"
	"log"

	"gopkg.in/h2non/bimg.v1"
)

func main() {
	f, err := ioutil.ReadFile("image.jpeg")
	if err != nil {
		log.Println(err)
	}
	img := bimg.NewImage(f)
	_, err = img.Resize(100, 0)
	if err != nil {
		log.Println(err)
	}
}
