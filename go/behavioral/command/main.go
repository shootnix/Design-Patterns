package main

func main() {
	light := &Light{}
	remote := &RemoteControl{}

	remote.Press(&TurnOnCommand{light})
	remote.Press(&TurnOffCommand{light})
	remote.Press(&TurnOnCommand{light})
	remote.UndoLast()
	remote.UndoLast()
}
