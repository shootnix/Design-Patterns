package main

func main() {
	legacy := NewSMTPMailer("mail.example.com")

	var notifier Notifier = NewMailerAdapter(legacy)

	notifier.Notify("alice@example.com", "your order has shipped")
	notifier.Notify("bob@example.com", "password reset requested")
}
