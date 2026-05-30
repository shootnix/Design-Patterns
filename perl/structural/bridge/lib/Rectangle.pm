package Rectangle;

use v5.34;
use parent 'Shape';

sub new {
    my ($class, $renderer, $x, $y, $w, $h) = @_;
    my $self = $class->SUPER::new($renderer);
    @{$self}{qw(x y w h)} = ($x, $y, $w, $h);
    return $self;
}

sub draw {
    my ($self) = @_;
    $self->{renderer}->render_rect($self->{x}, $self->{y}, $self->{w}, $self->{h});
}

1;
