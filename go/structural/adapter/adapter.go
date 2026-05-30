package main

// MailerAdapter wraps SMTPMailer and implements the Notifier interface.
type MailerAdapter struct {
	mailer *SMTPMailer
}

func NewMailerAdapter(mailer *SMTPMailer) *MailerAdapter {
	return &MailerAdapter{mailer: mailer}
}

func (a *MailerAdapter) Notify(recipient, message string) {
	a.mailer.SendEmail(recipient, "Notification", message)
}
