package main

import "fmt"

type InventoryService struct{}

func (s *InventoryService) Reserve(item string, qty int) bool {
	fmt.Printf("[Inventory] reserving %d x %q\n", qty, item)
	return true
}

type PaymentService struct{}

func (s *PaymentService) Charge(card, amount string) bool {
	fmt.Printf("[Payment] charging %s to card %s\n", amount, card)
	return true
}

type ShippingService struct{}

func (s *ShippingService) Ship(item string, qty int) string {
	tracking := "TRK-12345"
	fmt.Printf("[Shipping] shipping %d x %q, tracking: %s\n", qty, item, tracking)
	return tracking
}
