package main

import "errors"

func NewPaymentProviderFactory(provider string) (PaymentProviderFactory, error) {
	switch provider {
	case "stripe":
		return StripeFactory{}, nil
	case "paypal":
		return PayPalFactory{}, nil
	default:
		return nil, errors.New("unsupported payment provider")
	}
}
