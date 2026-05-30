package main

type Circle struct {
	renderer       Renderer
	x, y, radius float64
}

func NewCircle(r Renderer, x, y, radius float64) *Circle {
	return &Circle{renderer: r, x: x, y: y, radius: radius}
}

func (c *Circle) Draw() {
	c.renderer.RenderCircle(c.x, c.y, c.radius)
}

type Rectangle struct {
	renderer   Renderer
	x, y, w, h float64
}

func NewRectangle(r Renderer, x, y, w, h float64) *Rectangle {
	return &Rectangle{renderer: r, x: x, y: y, w: w, h: h}
}

func (r *Rectangle) Draw() {
	r.renderer.RenderRect(r.x, r.y, r.w, r.h)
}
