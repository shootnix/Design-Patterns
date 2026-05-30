package main

func main() {
	data   := []int{5, 2, 8, 1, 9, 3}
	sorter := &Sorter{}

	sorter.SetStrategy(BubbleSort{})
	printSorted("Bubble", sorter.Sort(data))

	sorter.SetStrategy(StdSort{})
	printSorted("Std   ", sorter.Sort(data))
}
