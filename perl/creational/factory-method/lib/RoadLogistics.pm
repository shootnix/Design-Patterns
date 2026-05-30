package RoadLogistics;

use v5.34;
use parent 'Logistics';
use Truck;

sub create_transport {
    return Truck->new();
}

1;
