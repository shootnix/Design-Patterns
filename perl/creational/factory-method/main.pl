use v5.34;
use lib 'lib';

use Logistics;
use RoadLogistics;
use SeaLogistics;

my $road = RoadLogistics->new();
$road->plan_delivery('order-001');

my $sea = SeaLogistics->new();
$sea->plan_delivery('order-002');
