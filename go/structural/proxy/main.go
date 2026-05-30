package main

import "fmt"

func main() {
	var img Image = NewImageProxy("photo.jpg")

	fmt.Println("proxy created, image not loaded yet")

	fmt.Println()
	img.Display() // triggers load

	fmt.Println()
	img.Display() // uses cached RealImage

	fmt.Println()
	img.Display() // uses cached RealImage
}
