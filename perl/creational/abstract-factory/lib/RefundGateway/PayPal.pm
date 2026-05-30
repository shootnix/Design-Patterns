package RefundGateway::PayPal;

use v5.34;

sub new { bless {}, shift }

sub refund {
    my ($self, $transaction_id) = @_;
    printf "[PayPal] Refunding %s\n", $transaction_id;
}

1;