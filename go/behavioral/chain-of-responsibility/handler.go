package main

import "fmt"

type base struct{ next Handler }

func (b *base) SetNext(h Handler) Handler { b.next = h; return h }
func (b *base) pass(amount int) {
	if b.next != nil {
		b.next.Handle(amount)
	} else {
		fmt.Printf("  nobody approved $%d\n", amount)
	}
}

type TeamLead struct{ base }

func (h *TeamLead) Handle(amount int) {
	if amount <= 100 {
		fmt.Printf("[TeamLead] approved $%d\n", amount)
	} else {
		h.pass(amount)
	}
}

type Manager struct{ base }

func (h *Manager) Handle(amount int) {
	if amount <= 1000 {
		fmt.Printf("[Manager] approved $%d\n", amount)
	} else {
		h.pass(amount)
	}
}

type Director struct{ base }

func (h *Director) Handle(amount int) {
	if amount <= 10000 {
		fmt.Printf("[Director] approved $%d\n", amount)
	} else {
		h.pass(amount)
	}
}

type VP struct{ base }

func (h *VP) Handle(amount int) {
	fmt.Printf("[VP] approved $%d\n", amount)
}
