package ShippingService;

use v5.34;

sub new { bless {}, shift }

sub ship {
    my ($self, $item, $qty) = @_;
    my $tracking = 'TRK-12345';
    printf "[Shipping] shipping %d x '%s', tracking: %s\n", $qty, $item, $tracking;
    return $tracking;
}

1;
