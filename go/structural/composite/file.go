package main

import "fmt"

type File struct {
	name string
	size int
}

func NewFile(name string, size int) *File {
	return &File{name: name, size: size}
}

func (f *File) Size() int {
	return f.size
}

func (f *File) Print(indent string) {
	fmt.Printf("%s- %s (%d B)\n", indent, f.name, f.size)
}
