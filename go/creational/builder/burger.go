package main

import "fmt"

type Burger struct {
	Bun     string
	Patty   string
	Cheese  string
	Sauce   string
	Bacon   bool
	Lettuce bool
	Tomato  bool
}

func (b Burger) String() string {
	return fmt.Sprintf(
		"Burger{Bun: %s, Patty: %s, Cheese: %s, Sauce: %s, Bacon: %t, Lettuce: %t, Tomato: %t}",
		b.Bun,
		b.Patty,
		b.Cheese,
		b.Sauce,
		b.Bacon,
		b.Lettuce,
		b.Tomato,
	)
}
