package main

import "fmt"

func main() {
	a := GetLogger()
	b := GetLogger()

	a.Log("starting application")
	b.Log("connecting to database")
	a.Log("request received")

	fmt.Printf("same instance: %v\n", a == b)
	fmt.Printf("total entries: %d\n", len(a.Entries()))
}
