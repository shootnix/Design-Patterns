package TreeType;

use v5.34;

sub new {
    my ($class, $species, $color) = @_;
    return bless { species => $species, color => $color }, $class;
}

sub draw {
    my ($self, $x, $y) = @_;
    printf "[%s/%s] at (%d,%d)\n", $self->{species}, $self->{color}, $x, $y;
}

1;
