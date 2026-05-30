package main

import "fmt"

type RoadLogistics struct{}

func (r RoadLogistics) CreateTransport() Transport {
	return Truck{}
}

type Truck struct{}

func (t Truck) Deliver(order string) {
	fmt.Printf("[Truck] Delivering %q by road\n", order)
}
