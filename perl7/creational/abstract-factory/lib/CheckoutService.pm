use v5.42;
use feature 'class';
no warnings 'experimental::class';

class CheckoutService {
    field $factory :param;
    field $payments;
    field $refunds;
    field $webhook;

    ADJUST {
        $payments = $factory->create_payment_gateway();
        $refunds = $factory->create_refund_gateway();
        $webhook = $factory->create_webhook_verifier();
    }

    method checkout($amount_cents) {
        return $payments->charge($amount_cents);
    }

    method refund($transaction_id) {
        return $refunds->refund($transaction_id);
    }

    method handle_webhook($payload, $signature) {
        return $webhook->verify($payload, $signature);
    }
}