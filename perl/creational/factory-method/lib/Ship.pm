package Ship;

use v5.34;

sub new { bless {}, shift }

sub deliver {
    my ($self, $order) = @_;
    printf "[Ship] Delivering %s by sea\n", $order;
}

1;
