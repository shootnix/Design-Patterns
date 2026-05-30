package main

import "fmt"

type Observer interface {
	Update(symbol string, price float64)
}

type Subject interface {
	Subscribe(Observer)
	Unsubscribe(Observer)
	Notify(symbol string, price float64)
}

// StockMarket is the concrete subject.
type StockMarket struct {
	observers []Observer
	prices    map[string]float64
}

func NewStockMarket() *StockMarket {
	return &StockMarket{prices: make(map[string]float64)}
}

func (s *StockMarket) Subscribe(o Observer)   { s.observers = append(s.observers, o) }
func (s *StockMarket) Unsubscribe(o Observer) {
	for i, ob := range s.observers {
		if ob == o {
			s.observers = append(s.observers[:i], s.observers[i+1:]...)
			return
		}
	}
}
func (s *StockMarket) Notify(symbol string, price float64) {
	for _, o := range s.observers {
		o.Update(symbol, price)
	}
}
func (s *StockMarket) SetPrice(symbol string, price float64) {
	s.prices[symbol] = price
	s.Notify(symbol, price)
}

type Investor struct{ name string }

func (i *Investor) Update(symbol string, price float64) {
	fmt.Printf("[%s] %s is now $%.2f\n", i.name, symbol, price)
}

type PriceMonitor struct{}

func (m *PriceMonitor) Update(symbol string, price float64) {
	fmt.Printf("[Monitor] %s: $%.2f\n", symbol, price)
}
