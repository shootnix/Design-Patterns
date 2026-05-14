package main

type PaymentGateway interface {
	Charge(amountCents int) error
}

type RefundGateway interface {
	Refund(transactionID string) error
}

type WebhookVerifier interface {
	Verify(payload []byte, signature string) bool
}

type PaymentProviderFactory interface {
	CreatePaymentGateweay() PaymentGateway
	CreateRefundGateway() RefundGateway
	CreateWebhookVerifier() WebhookVerifier
}
