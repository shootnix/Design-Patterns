package CheckoutService;

use v5.34;

sub new {
    my ($class, $factory) = @_;

    my $self = {
        payments => $factory->create_payment_gateway(),
        refunds  => $factory->create_refund_gateway(),
        webhooks => $factory->create_webhook_verifier(),
    };

    return bless $self, $class;
}

sub checkout {
    my ($self, $amount_cents) = @_;
    return $self->{payments}->charge($amount_cents);
}

sub refund {
    my ($self, $transaction_id) = @_;
    return $self->{refunds}->refund($transaction_id);
}

sub handle_webhook {
    my ($self, $payload, $signature) = @_;
    return $self->{webhooks}->handle_webhook($payload, $signature);
}

1;