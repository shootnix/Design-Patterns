package main

func main() {
	market  := NewStockMarket()
	alice   := &Investor{"Alice"}
	bob     := &Investor{"Bob"}
	monitor := &PriceMonitor{}

	market.Subscribe(alice)
	market.Subscribe(bob)
	market.Subscribe(monitor)

	market.SetPrice("AAPL", 182.50)

	market.Unsubscribe(bob)
	market.SetPrice("AAPL", 185.00)
}
