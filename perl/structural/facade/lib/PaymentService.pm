package PaymentService;

use v5.34;

sub new { bless {}, shift }

sub charge {
    my ($self, $card, $amount) = @_;
    printf "[Payment] charging %s to card %s\n", $amount, $card;
    return 1;
}

1;
