package main

type Shape interface {
	Clone() Shape
	Describe() string
}
