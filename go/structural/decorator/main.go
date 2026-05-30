package main

import "fmt"

func printOrder(b Beverage) {
	fmt.Printf("%s - %d cents\n", b.Description(), b.Cost())
}

func main() {
	simple := Espresso{}
	latte  := WithMilk(Espresso{})
	fancy  := WithWhip(WithSugar(WithMilk(Espresso{})))

	printOrder(simple)
	printOrder(latte)
	printOrder(fancy)
}
