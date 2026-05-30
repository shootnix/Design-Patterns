package Logistics;

use v5.34;
use Carp qw/croak/;

sub new {
    my ($class) = @_;
    return bless {}, $class;
}

sub create_transport {
    croak ref(shift) . '::create_transport not implemented';
}

sub plan_delivery {
    my ($self, $order) = @_;
    my $transport = $self->create_transport();
    $transport->deliver($order);
}

1;
