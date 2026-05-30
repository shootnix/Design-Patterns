package main

import "fmt"

func main() {
	forest := NewForest()

	forest.Plant(1, 2, "oak", "green")
	forest.Plant(5, 8, "pine", "dark-green")
	forest.Plant(3, 4, "oak", "green")      // reuses oak/green
	forest.Plant(9, 1, "birch", "white")
	forest.Plant(2, 7, "pine", "dark-green") // reuses pine/dark-green
	forest.Plant(6, 3, "oak", "green")      // reuses oak/green

	fmt.Println()
	forest.Draw()
	fmt.Printf("\ntrees: %d  TreeType objects: %d\n",
		len(forest.trees), forest.factory.Count())
}
