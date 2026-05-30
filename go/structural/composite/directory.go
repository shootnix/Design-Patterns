package main

import "fmt"

type Directory struct {
	name     string
	children []FileSystemNode
}

func NewDirectory(name string) *Directory {
	return &Directory{name: name}
}

func (d *Directory) Add(node FileSystemNode) {
	d.children = append(d.children, node)
}

func (d *Directory) Size() int {
	total := 0
	for _, child := range d.children {
		total += child.Size()
	}
	return total
}

func (d *Directory) Print(indent string) {
	fmt.Printf("%s+ %s/ (%d B)\n", indent, d.name, d.Size())
	for _, child := range d.children {
		child.Print(indent + "  ")
	}
}
