package main

import "fmt"

func main() {
	registry := NewShapeRegistry()
	registry.Register("small-red-circle", &Circle{Radius: 5, Color: "red"})
	registry.Register("wide-blue-rect", &Rectangle{Width: 20, Height: 5, Color: "blue"})

	c1, _ := registry.Clone("small-red-circle")
	c2, _ := registry.Clone("small-red-circle")

	c1.(*Circle).Color = "green"

	fmt.Println(c1.Describe()) // green — mutation did not affect the prototype
	fmt.Println(c2.Describe()) // red   — independent copy

	r1, _ := registry.Clone("wide-blue-rect")
	fmt.Println(r1.Describe())
}
