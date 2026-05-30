package Truck;

use v5.34;

sub new { bless {}, shift }

sub deliver {
    my ($self, $order) = @_;
    printf "[Truck] Delivering %s by road\n", $order;
}

1;
