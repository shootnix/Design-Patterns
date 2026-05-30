package main

import "fmt"

// SMTPMailer is the legacy third-party type with an incompatible interface.
// It cannot be modified.
type SMTPMailer struct {
	host string
}

func NewSMTPMailer(host string) *SMTPMailer {
	return &SMTPMailer{host: host}
}

func (m *SMTPMailer) SendEmail(to, subject, body string) {
	fmt.Printf("[SMTP:%s] To: %s | Subject: %s | Body: %s\n", m.host, to, subject, body)
}
