package VectorRenderer;

use v5.34;
use parent 'Renderer';

sub render_circle {
    my ($self, $x, $y, $radius) = @_;
    printf "[Vector] circle at (%d,%d) r=%d\n", $x, $y, $radius;
}

sub render_rect {
    my ($self, $x, $y, $w, $h) = @_;
    printf "[Vector] rect at (%d,%d) %dx%d\n", $x, $y, $w, $h;
}

1;
