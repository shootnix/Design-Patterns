package main

import "fmt"

// PayPal implementation

type PayPalPaymentGateway struct{}
type PayPalRefundGateway struct{}
type PayPalWebhookVerifier struct{}
type PayPalFactory struct{}

/* factory */
func (f PayPalFactory) CreatePaymentGateweay() PaymentGateway {
	return PayPalPaymentGateway{}
}

func (f PayPalFactory) CreateRefundGateway() RefundGateway {
	return PayPalRefundGateway{}
}

func (f PayPalFactory) CreateWebhookVerifier() WebhookVerifier {
	return PayPalWebhookVerifier{}
}

/* implementation */
func (pg PayPalPaymentGateway) Charge(amountCents int) error {
	fmt.Printf("[PayPal] Charging %d cents\n", amountCents)
	return nil
}

func (rg PayPalRefundGateway) Refund(transactionID string) error {
	fmt.Printf("[PayPal] Refunding %s\n", transactionID)
	return nil
}

func (wf PayPalWebhookVerifier) Verify(payload []byte, signature string) bool {
	fmt.Printf("[PayPal] Verifying webhook with signature %q\n", signature)

	return len(payload) > 0 && signature != ""
}
