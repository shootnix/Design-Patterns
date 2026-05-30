use v5.42;
use feature 'class';
no warnings 'experimental::class';

use Interface;

class RoadLogistics :isa(ILogistics) {
    method create_transport() {
        return Truck->new();
    }
}

class Truck :isa(ITransport) {
    method deliver($order) {
        printf "[Truck] Delivering %s by road\n", $order;
    }
}
