package ShapeRegistry;

use v5.34;
use Carp qw/croak/;

sub new {
    return bless { prototypes => {} }, shift;
}

sub register {
    my ($self, $name, $shape) = @_;
    $self->{prototypes}{$name} = $shape;
}

sub clone {
    my ($self, $name) = @_;
    my $proto = $self->{prototypes}{$name}
        or croak "unknown prototype: $name";
    return $proto->clone();
}

1;
