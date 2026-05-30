package Circle;

use v5.34;
use parent 'Shape';

sub clone {
    my ($self) = @_;
    return Circle->new(%$self);
}

sub describe {
    my ($self) = @_;
    printf "Circle{radius: %.1f, color: %s}\n", $self->{radius}, $self->{color};
}

1;
