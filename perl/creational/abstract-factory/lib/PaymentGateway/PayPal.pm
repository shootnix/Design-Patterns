package PaymentGateway::PayPal;

use v5.34;

sub new { bless {}, shift }

sub charge {
    my ($self, $amount_cents) = @_;
    printf "[PayPal] Charging %d cents\n", $amount_cents;
}

1;