package PaymentGateway::Stripe;

use v5.34;

sub new { bless {}, shift }

sub charge {
    my ($self, $amount_cents) = @_;
    printf "[Stripe] Charging %d cents\n", $amount_cents;
}

1;