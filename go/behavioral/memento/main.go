package main

import "fmt"

func main() {
	editor  := &Editor{}
	history := &History{}

	editor.Type("Hello")
	history.Push(editor.Save())

	editor.Type(", world")
	history.Push(editor.Save())

	editor.Type("!!!")
	editor.Print()

	if m, ok := history.Pop(); ok {
		editor.Restore(m)
		fmt.Print("[undo] ")
		editor.Print()
	}
	if m, ok := history.Pop(); ok {
		editor.Restore(m)
		fmt.Print("[undo] ")
		editor.Print()
	}
}
