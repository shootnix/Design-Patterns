package main

import "fmt"

type Circle struct {
	Radius float64
	Color  string
}

func (c *Circle) Clone() Shape {
	clone := *c
	return &clone
}

func (c *Circle) Describe() string {
	return fmt.Sprintf("Circle{radius: %.1f, color: %s}", c.Radius, c.Color)
}

type Rectangle struct {
	Width  float64
	Height float64
	Color  string
}

func (r *Rectangle) Clone() Shape {
	clone := *r
	return &clone
}

func (r *Rectangle) Describe() string {
	return fmt.Sprintf("Rectangle{width: %.1f, height: %.1f, color: %s}", r.Width, r.Height, r.Color)
}
