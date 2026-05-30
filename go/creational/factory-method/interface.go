package main

type Transport interface {
	Deliver(order string)
}

type Logistics interface {
	CreateTransport() Transport
}

func PlanDelivery(l Logistics, order string) {
	transport := l.CreateTransport()
	transport.Deliver(order)
}
