package main

func main() {
	tl := &TeamLead{}
	tl.SetNext(&Manager{}).SetNext(&Director{}).SetNext(&VP{})

	for _, amount := range []int{50, 500, 5000, 50000} {
		tl.Handle(amount)
	}
}
