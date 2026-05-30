package main

type Espresso struct{}

func (e Espresso) Cost() int           { return 200 }
func (e Espresso) Description() string { return "Espresso" }
