package main

type CheckoutService struct {
	payments PaymentGateway
	refunds  RefundGateway
	webhooks WebhookVerifier
}

func NewCheckoutService(f PaymentProviderFactory) CheckoutService {
	return CheckoutService{
		payments: f.CreatePaymentGateweay(),
		refunds:  f.CreateRefundGateway(),
		webhooks: f.CreateWebhookVerifier(),
	}
}

func (c CheckoutService) Checkout(amountCents int) error {
	return c.payments.Charge(amountCents)
}

func (c CheckoutService) Refund(transactionID string) error {
	return c.refunds.Refund(transactionID)
}

func (c CheckoutService) HandleWebhook(payload []byte, signature string) bool {
	return c.webhooks.Verify(payload, signature)
}

func main() {
	factory, err := NewPaymentProviderFactory("stripe")
	if err != nil {
		panic(err)
	}

	checkout := NewCheckoutService(factory)

	checkout.Checkout(999)
	checkout.Refund("trx-123")
	checkout.HandleWebhook([]byte(`{"result": "ok"}`), "valid-signature")
}
