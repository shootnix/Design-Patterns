package main

func main() {
	printAll(NewRangeIterator(1, 10, 1))  // 1..10
	printAll(NewRangeIterator(0, 20, 2))  // even numbers
	printAll(NewRangeIterator(10, 1, -1)) // nothing: start > end
}
