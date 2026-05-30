package main

import "fmt"

type Visitor interface {
	VisitCircle(c *Circle)
	VisitRectangle(r *Rectangle)
}

type Shape interface {
	Accept(Visitor)
}

type Circle struct{ Radius float64 }

func (c *Circle) Accept(v Visitor) { v.VisitCircle(c) }

type Rectangle struct{ Width, Height float64 }

func (r *Rectangle) Accept(v Visitor) { v.VisitRectangle(r) }

// AreaVisitor computes area.
type AreaVisitor struct{ Total float64 }

func (a *AreaVisitor) VisitCircle(c *Circle) {
	area := 3.14159 * c.Radius * c.Radius
	a.Total += area
	fmt.Printf("[Area] circle r=%.1f => %.2f\n", c.Radius, area)
}
func (a *AreaVisitor) VisitRectangle(r *Rectangle) {
	area := r.Width * r.Height
	a.Total += area
	fmt.Printf("[Area] rect %.1fx%.1f => %.2f\n", r.Width, r.Height, area)
}

// SVGVisitor renders shapes as SVG elements.
type SVGVisitor struct{}

func (SVGVisitor) VisitCircle(c *Circle) {
	fmt.Printf("<circle r=\"%.1f\"/>\n", c.Radius)
}
func (SVGVisitor) VisitRectangle(r *Rectangle) {
	fmt.Printf("<rect width=\"%.1f\" height=\"%.1f\"/>\n", r.Width, r.Height)
}
