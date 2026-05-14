package RefundGateway::Stripe;

use v5.34;

sub new { bless {}, shift }

sub refund {
    my ($self, $transaction_id) = @_;
    printf "[Stripe] Refunding %s\n", $transaction_id;
}

1;