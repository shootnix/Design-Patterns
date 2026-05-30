package main

type BurgerBuilder struct {
	burger Burger
}

func NewBurgerBuilder() *BurgerBuilder {
	return &BurgerBuilder{
		burger: Burger{
			Bun: "regular",
		},
	}
}

func (b *BurgerBuilder) WithBun(bun string) *BurgerBuilder {
	b.burger.Bun = bun
	return b
}

func (b *BurgerBuilder) WithPatty(patty string) *BurgerBuilder {
	b.burger.Patty = patty
	return b
}

func (b *BurgerBuilder) WithCheese(cheese string) *BurgerBuilder {
	b.burger.Cheese = cheese
	return b
}

func (b *BurgerBuilder) WithSauce(sauce string) *BurgerBuilder {
	b.burger.Sauce = sauce
	return b
}

func (b *BurgerBuilder) AddBacon() *BurgerBuilder {
	b.burger.Bacon = true
	return b
}

func (b *BurgerBuilder) AddLettuce() *BurgerBuilder {
	b.burger.Lettuce = true
	return b
}

func (b *BurgerBuilder) AddTomato() *BurgerBuilder {
	b.burger.Tomato = true
	return b
}

func (b *BurgerBuilder) Build() Burger {
	return b.burger
}
