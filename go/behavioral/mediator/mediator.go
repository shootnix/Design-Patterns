package main

import "fmt"

type Mediator interface {
	Send(from, message string)
}

type User struct {
	name     string
	mediator Mediator
}

func (u *User) Say(message string)              { u.mediator.Send(u.name, message) }
func (u *User) Receive(from, message string)    { fmt.Printf("[%s] %s: %s\n", u.name, from, message) }

type ChatRoom struct {
	users map[string]*User
}

func NewChatRoom() *ChatRoom {
	return &ChatRoom{users: make(map[string]*User)}
}

func (c *ChatRoom) Register(u *User) {
	c.users[u.name] = u
	u.mediator = c
}

func (c *ChatRoom) Send(from, message string) {
	for name, u := range c.users {
		if name != from {
			u.Receive(from, message)
		}
	}
}
