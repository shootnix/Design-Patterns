package Rectangle;

use v5.34;
use parent 'Shape';

sub clone {
    my ($self) = @_;
    return Rectangle->new(%$self);
}

sub describe {
    my ($self) = @_;
    printf "Rectangle{width: %.1f, height: %.1f, color: %s}\n",
        $self->{width}, $self->{height}, $self->{color};
}

1;
