use v5.42;
use feature 'class';
no warnings 'experimental::class';

use Interface;

class PayPalFactory :isa(IPaymentProviderFactory) {
    method create_payment_gateway() {
        return PayPalPaymentGateway->new();
    }

    method create_refund_gateway() {
        return PayPalRefundGateway->new();
    }

    method create_webhook_verifier() {
        return PayPalWebhookVerifier->new();
    }
}

class PayPalPaymentGateway :isa(IPaymentGateway) {
    method charge($amount_cents) {
        printf "[PayPal] Charging %d cents\n", $amount_cents;
    }
}

class PayPalRefundGateway :isa(IRefundGateway) {
    method refund($transaction_id) {
        printf "[PayPal] Refunding %s\n", $transaction_id;
    }
}

class PayPalWebhookVerifier :isa(IWebhookVerifier) {
    method verify($payload, $signature) {
        printf "[PayPal] Verifying webhook with signature %s\n", $signature;
        return $payload && $signature;
    }
}