package main

import "fmt"

// Memento stores a snapshot of Editor state.
type Memento struct{ content string }

// Editor is the originator.
type Editor struct{ content string }

func (e *Editor) Type(text string)       { e.content += text }
func (e *Editor) Save() Memento          { return Memento{e.content} }
func (e *Editor) Restore(m Memento)      { e.content = m.content }
func (e *Editor) Print()                 { fmt.Printf("content: %q\n", e.content) }

// History is the caretaker.
type History struct{ stack []Memento }

func (h *History) Push(m Memento)        { h.stack = append(h.stack, m) }
func (h *History) Pop() (Memento, bool) {
	if len(h.stack) == 0 {
		return Memento{}, false
	}
	m := h.stack[len(h.stack)-1]
	h.stack = h.stack[:len(h.stack)-1]
	return m, true
}
