package RasterRenderer;

use v5.34;
use parent 'Renderer';

sub render_circle {
    my ($self, $x, $y, $radius) = @_;
    printf "[Raster] circle pixels at (%d,%d) r=%d\n", $x, $y, $radius;
}

sub render_rect {
    my ($self, $x, $y, $w, $h) = @_;
    printf "[Raster] rect pixels at (%d,%d) %dx%d\n", $x, $y, $w, $h;
}

1;
