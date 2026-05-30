package main

import "fmt"

type ImageProxy struct {
	filename  string
	realImage *RealImage
}

func NewImageProxy(filename string) *ImageProxy {
	return &ImageProxy{filename: filename}
}

func (p *ImageProxy) Display() {
	if p.realImage == nil {
		fmt.Printf("[Proxy] first access -- loading %q\n", p.filename)
		p.realImage = NewRealImage(p.filename)
	}
	p.realImage.Display()
}
