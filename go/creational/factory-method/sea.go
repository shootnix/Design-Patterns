package main

import "fmt"

type SeaLogistics struct{}

func (s SeaLogistics) CreateTransport() Transport {
	return Ship{}
}

type Ship struct{}

func (s Ship) Deliver(order string) {
	fmt.Printf("[Ship] Delivering %q by sea\n", order)
}
