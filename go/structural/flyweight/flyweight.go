package main

import "fmt"

// TreeType holds intrinsic (shared) state.
type TreeType struct {
	species string
	color   string
}

func (t *TreeType) draw(x, y int) {
	fmt.Printf("[%s/%s] at (%d,%d)\n", t.species, t.color, x, y)
}

// TreeTypeFactory caches and reuses TreeType instances.
type TreeTypeFactory struct {
	cache map[string]*TreeType
}

func NewTreeTypeFactory() *TreeTypeFactory {
	return &TreeTypeFactory{cache: make(map[string]*TreeType)}
}

func (f *TreeTypeFactory) Get(species, color string) *TreeType {
	key := species + "/" + color
	if t, ok := f.cache[key]; ok {
		return t
	}
	t := &TreeType{species: species, color: color}
	f.cache[key] = t
	fmt.Printf("[Factory] new TreeType: %s\n", key)
	return t
}

func (f *TreeTypeFactory) Count() int { return len(f.cache) }
