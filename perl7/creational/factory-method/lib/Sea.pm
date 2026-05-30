use v5.42;
use feature 'class';
no warnings 'experimental::class';

use Interface;

class SeaLogistics :isa(ILogistics) {
    method create_transport() {
        return Ship->new();
    }
}

class Ship :isa(ITransport) {
    method deliver($order) {
        printf "[Ship] Delivering %s by sea\n", $order;
    }
}
