package main

func main() {
	facade := NewOrderFacade()
	facade.PlaceOrder("wireless keyboard", 2, "card-4242")
}
