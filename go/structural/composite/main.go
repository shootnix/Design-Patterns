package main

func main() {
	root := NewDirectory("root")

	src := NewDirectory("src")
	src.Add(NewFile("main.go", 1200))
	src.Add(NewFile("handler.go", 800))

	assets := NewDirectory("assets")
	assets.Add(NewFile("logo.png", 48000))
	assets.Add(NewFile("style.css", 3200))

	root.Add(src)
	root.Add(assets)
	root.Add(NewFile("README.md", 640))

	root.Print("")
}
