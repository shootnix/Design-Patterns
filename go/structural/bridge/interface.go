package main

// Renderer is the Implementation side of the bridge.
type Renderer interface {
	RenderCircle(x, y, radius float64)
	RenderRect(x, y, w, h float64)
}

// Shape is the Abstraction side of the bridge.
type Shape interface {
	Draw()
}
