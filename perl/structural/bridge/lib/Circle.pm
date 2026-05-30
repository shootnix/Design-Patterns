package Circle;

use v5.34;
use parent 'Shape';

sub new {
    my ($class, $renderer, $x, $y, $radius) = @_;
    my $self = $class->SUPER::new($renderer);
    @{$self}{qw(x y radius)} = ($x, $y, $radius);
    return $self;
}

sub draw {
    my ($self) = @_;
    $self->{renderer}->render_circle($self->{x}, $self->{y}, $self->{radius});
}

1;
