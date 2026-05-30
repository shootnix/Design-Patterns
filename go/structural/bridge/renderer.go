package main

import "fmt"

type VectorRenderer struct{}

func (v VectorRenderer) RenderCircle(x, y, radius float64) {
	fmt.Printf("[Vector] circle at (%.0f,%.0f) r=%.0f\n", x, y, radius)
}

func (v VectorRenderer) RenderRect(x, y, w, h float64) {
	fmt.Printf("[Vector] rect at (%.0f,%.0f) %.0fx%.0f\n", x, y, w, h)
}

type RasterRenderer struct{}

func (r RasterRenderer) RenderCircle(x, y, radius float64) {
	fmt.Printf("[Raster] circle pixels at (%.0f,%.0f) r=%.0f\n", x, y, radius)
}

func (r RasterRenderer) RenderRect(x, y, w, h float64) {
	fmt.Printf("[Raster] rect pixels at (%.0f,%.0f) %.0fx%.0f\n", x, y, w, h)
}
