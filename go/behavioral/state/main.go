package main

func main() {
	tl := NewTrafficLight()
	for range 6 {
		tl.Status()
		tl.Next()
	}
}
