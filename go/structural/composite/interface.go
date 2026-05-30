package main

type FileSystemNode interface {
	Size() int
	Print(indent string)
}
