package main

import (
	"fmt"
	"sort"
)

type SortStrategy interface {
	Sort(data []int) []int
}

type Sorter struct{ strategy SortStrategy }

func (s *Sorter) SetStrategy(st SortStrategy) { s.strategy = st }
func (s *Sorter) Sort(data []int) []int        { return s.strategy.Sort(data) }

// BubbleSort — O(n²), educational.
type BubbleSort struct{}

func (BubbleSort) Sort(data []int) []int {
	out := append([]int{}, data...)
	for i := range out {
		for j := 0; j < len(out)-i-1; j++ {
			if out[j] > out[j+1] {
				out[j], out[j+1] = out[j+1], out[j]
			}
		}
	}
	return out
}

// StdSort — delegates to Go's stdlib sort.
type StdSort struct{}

func (StdSort) Sort(data []int) []int {
	out := append([]int{}, data...)
	sort.Ints(out)
	return out
}

func printSorted(name string, result []int) {
	fmt.Printf("[%s] %v\n", name, result)
}
