use v5.42;

use Road;
use Sea;

my $road = RoadLogistics->new();
$road->plan_delivery('order-001');

my $sea = SeaLogistics->new();
$sea->plan_delivery('order-002');
