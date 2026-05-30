package main

import "fmt"

type Command interface {
	Execute()
	Undo()
}

// Light is the receiver.
type Light struct{ on bool }

func (l *Light) TurnOn()  { l.on = true; fmt.Println("[Light] on") }
func (l *Light) TurnOff() { l.on = false; fmt.Println("[Light] off") }

type TurnOnCommand struct{ light *Light }

func (c *TurnOnCommand) Execute() { c.light.TurnOn() }
func (c *TurnOnCommand) Undo()    { c.light.TurnOff() }

type TurnOffCommand struct{ light *Light }

func (c *TurnOffCommand) Execute() { c.light.TurnOff() }
func (c *TurnOffCommand) Undo()    { c.light.TurnOn() }

// RemoteControl is the invoker.
type RemoteControl struct{ history []Command }

func (r *RemoteControl) Press(cmd Command) {
	cmd.Execute()
	r.history = append(r.history, cmd)
}

func (r *RemoteControl) UndoLast() {
	if len(r.history) == 0 {
		return
	}
	last := r.history[len(r.history)-1]
	r.history = r.history[:len(r.history)-1]
	fmt.Print("[Undo] ")
	last.Undo()
}
