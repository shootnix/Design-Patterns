package Factory::Stripe;

use v5.34;

use PaymentGateway::Stripe;
use RefundGateway::Stripe;
use WebhookVerifier::Stripe;

sub new {
    my ($class) = @_;
    return bless {}, $class;
}

sub create_payment_gateway {
    my ($self) = @_;
    return PaymentGateway::Stripe->new();
}

sub create_refund_gateway {
    my ($self) = @_;
    return RefundGateway::Stripe->new();
}

sub create_webhook_verifier {
    my ($self) = @_;
    return WebhookVerifier::Stripe->new();
}

1;