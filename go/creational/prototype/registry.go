package main

import "fmt"

type ShapeRegistry struct {
	prototypes map[string]Shape
}

func NewShapeRegistry() *ShapeRegistry {
	return &ShapeRegistry{prototypes: make(map[string]Shape)}
}

func (r *ShapeRegistry) Register(name string, shape Shape) {
	r.prototypes[name] = shape
}

func (r *ShapeRegistry) Clone(name string) (Shape, error) {
	proto, ok := r.prototypes[name]
	if !ok {
		return nil, fmt.Errorf("unknown prototype: %s", name)
	}
	return proto.Clone(), nil
}
