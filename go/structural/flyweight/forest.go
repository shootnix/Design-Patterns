package main

// Tree holds extrinsic state (position) and a pointer to a shared TreeType.
type Tree struct {
	x, y     int
	treeType *TreeType
}

func (t *Tree) draw() { t.treeType.draw(t.x, t.y) }

type Forest struct {
	trees   []*Tree
	factory *TreeTypeFactory
}

func NewForest() *Forest {
	return &Forest{factory: NewTreeTypeFactory()}
}

func (f *Forest) Plant(x, y int, species, color string) {
	tt := f.factory.Get(species, color)
	f.trees = append(f.trees, &Tree{x: x, y: y, treeType: tt})
}

func (f *Forest) Draw() {
	for _, t := range f.trees {
		t.draw()
	}
}
