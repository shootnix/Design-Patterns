package main

import "fmt"

type RealImage struct {
	filename string
}

func NewRealImage(filename string) *RealImage {
	fmt.Printf("[RealImage] loading %q from disk\n", filename)
	return &RealImage{filename: filename}
}

func (r *RealImage) Display() {
	fmt.Printf("[RealImage] displaying %q\n", r.filename)
}
