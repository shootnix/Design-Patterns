use v5.42;
use feature 'class';
no warnings 'experimental::class';

class ITransport {
    method deliver($order) { ... }
}

class ILogistics {
    method create_transport() { ... }

    method plan_delivery($order) {
        my $transport = $self->create_transport();
        $transport->deliver($order);
    }
}
