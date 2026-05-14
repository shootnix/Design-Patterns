package main

import "fmt"

// Stripe implementation

type StripePaymentGateway struct{}
type StripeRefundGateway struct{}
type StripeWebhookVerifier struct{}
type StripeFactory struct{}

/* factory */
func (f StripeFactory) CreatePaymentGateweay() PaymentGateway {
	return StripePaymentGateway{}
}

func (f StripeFactory) CreateRefundGateway() RefundGateway {
	return StripeRefundGateway{}
}

func (f StripeFactory) CreateWebhookVerifier() WebhookVerifier {
	return StripeWebhookVerifier{}
}

/* implementation */
func (pg StripePaymentGateway) Charge(amountCents int) error {
	fmt.Printf("[Stripe] Charging %d cents\n", amountCents)
	return nil
}

func (rg StripeRefundGateway) Refund(transactionID string) error {
	fmt.Printf("[Stripe] Refunding %s\n", transactionID)
	return nil
}

func (wf StripeWebhookVerifier) Verify(payload []byte, signature string) bool {
	fmt.Printf("[Stripe] Verifying webhook with signature %q\n", signature)

	return len(payload) > 0 && signature != ""
}
