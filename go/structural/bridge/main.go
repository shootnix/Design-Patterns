package main

func main() {
	vector := VectorRenderer{}
	raster := RasterRenderer{}

	shapes := []Shape{
		NewCircle(vector, 5, 10, 20),
		NewCircle(raster, 5, 10, 20),
		NewRectangle(vector, 0, 0, 100, 50),
		NewRectangle(raster, 0, 0, 100, 50),
	}

	for _, s := range shapes {
		s.Draw()
	}
}
