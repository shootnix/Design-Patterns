package main

import "fmt"

func main() {
	classicBurger := NewBurgerBuilder().
		WithPatty("beef").
		WithCheese("cheddar").
		WithSauce("ketchup").
		AddLettuce().
		AddTomato().
		Build()
	baconBurger := NewBurgerBuilder().
		WithBun("brioche").
		WithPatty("beef").
		WithCheese("american").
		WithSauce("bbq").
		AddBacon().
		Build()
	veggieBurger := NewBurgerBuilder().
		WithPatty("vegetable").
		WithCheese("swiss").
		WithSauce("garlic").
		AddLettuce().
		AddTomato().
		Build()
	fmt.Println(classicBurger)
	fmt.Println(baconBurger)
	fmt.Println(veggieBurger)
}
