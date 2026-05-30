package main

import "fmt"

type OrderFacade struct {
	inventory *InventoryService
	payment   *PaymentService
	shipping  *ShippingService
}

func NewOrderFacade() *OrderFacade {
	return &OrderFacade{
		inventory: &InventoryService{},
		payment:   &PaymentService{},
		shipping:  &ShippingService{},
	}
}

func (f *OrderFacade) PlaceOrder(item string, qty int, card string) {
	fmt.Printf("--- placing order: %d x %q ---\n", qty, item)

	if !f.inventory.Reserve(item, qty) {
		fmt.Println("order failed: out of stock")
		return
	}
	if !f.payment.Charge(card, "$99.99") {
		fmt.Println("order failed: payment declined")
		return
	}
	tracking := f.shipping.Ship(item, qty)
	fmt.Printf("order complete, tracking: %s\n", tracking)
}
