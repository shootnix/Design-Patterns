package main

type Handler interface {
	SetNext(Handler) Handler
	Handle(amount int)
}
