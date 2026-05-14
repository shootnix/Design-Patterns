use v5.42;
use feature 'class';
no warnings 'experimental::class';

class IPaymentGateway {
    method charge($amount_cents) {
        ...
    }
}

class IRefundGateway {
    method refund($transaction_id) {
        ...
    }
}

class IWebhookVerifier {
    method verify($payload, $signature) {
        ...
    }
}

class IPaymentProviderFactory {
    method create_payment_gateway() {
        ...
    }

    method create_refund_gateway() {
        ...
    }

    method create_webhook_verifier() {
        ...
    }
}