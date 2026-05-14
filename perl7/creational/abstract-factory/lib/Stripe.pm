use v5.42;
use feature 'class';
no warnings 'experimental::class';

use Interface;

class StripeFactory :isa(IPaymentProviderFactory) {
    method create_payment_gateway() {
        return StripePaymentGateway->new();
    }

    method create_refund_gateway() {
        return StripeRefundGateway->new();
    }

    method create_webhook_verifier() {
        return StripeWebhookVerifier->new();
    }
}

class StripePaymentGateway :isa(IPaymentGateway) {
    method charge($amount_cents) {
        printf "[Stripe] Charging %d cents\n", $amount_cents;
    }
}

class StripeRefundGateway :isa(IRefundGateway) {
    method refund($transaction_id) {
        printf "[Stripe] Refunding %s\n", $transaction_id;
    }
}

class StripeWebhookVerifier :isa(IWebhookVerifier) {
    method verify($payload, $signature) {
        printf "[Stripe] Verifying webhook with signature %s\n", $signature;
        return $payload && $signature;
    }
}