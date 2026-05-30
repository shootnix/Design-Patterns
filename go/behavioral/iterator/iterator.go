package main

import "fmt"

type Iterator interface {
	HasNext() bool
	Next() int
}

// RangeIterator iterates integers from start to end (inclusive) by step.
type RangeIterator struct {
	current, end, step int
}

func NewRangeIterator(start, end, step int) *RangeIterator {
	return &RangeIterator{current: start, end: end, step: step}
}

func (r *RangeIterator) HasNext() bool { return r.current <= r.end }
func (r *RangeIterator) Next() int {
	v := r.current
	r.current += r.step
	return v
}

func printAll(it Iterator) {
	for it.HasNext() {
		fmt.Printf("%d ", it.Next())
	}
	fmt.Println()
}
