package Factory::PayPal;

use v5.34;

use PaymentGateway::PayPal;
use RefundGateway::PayPal;
use WebhookVerifier::PayPal;

sub new {
    my ($class) = @_;
    return bless {}, $class;
}

sub create_payment_gateway {
    my ($self) = @_;
    return PaymentGateway::PayPal->new();
}

sub create_refund_gateway {
    my ($self) = @_;
    return RefundGateway::PayPal->new();
}

sub create_webhook_verifier {
    my ($self) = @_;
    return WebhookVerifier::PayPal->new();
}

1;