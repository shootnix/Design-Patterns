package main

import "fmt"

func main() {
	shapes := []Shape{
		&Circle{Radius: 5},
		&Rectangle{Width: 10, Height: 4},
		&Circle{Radius: 3},
	}

	area := &AreaVisitor{}
	for _, s := range shapes {
		s.Accept(area)
	}
	fmt.Printf("total area: %.2f\n\n", area.Total)

	svg := SVGVisitor{}
	for _, s := range shapes {
		s.Accept(svg)
	}
}
