package main

func main() {
	// (3 + 4) * 2
	expr := Multiply{
		left:  Add{Number{3}, Number{4}},
		right: Number{2},
	}
	eval(expr) // 14

	// 10 - (2 + 3)
	expr2 := Subtract{
		left:  Number{10},
		right: Add{Number{2}, Number{3}},
	}
	eval(expr2) // 5
}
