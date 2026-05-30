package main

// Notifier is the target interface the client code depends on.
type Notifier interface {
	Notify(recipient, message string)
}
