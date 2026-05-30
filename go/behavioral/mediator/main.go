package main

func main() {
	room := NewChatRoom()

	alice := &User{name: "Alice"}
	bob   := &User{name: "Bob"}
	carol := &User{name: "Carol"}

	room.Register(alice)
	room.Register(bob)
	room.Register(carol)

	alice.Say("hello everyone")
	bob.Say("hi Alice!")
}
