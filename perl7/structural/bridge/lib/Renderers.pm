use v5.42;
use feature 'class';
no warnings 'experimental::class';

use Interface;

class VectorRenderer :isa(IRenderer) {
    method render_circle($x, $y, $radius) {
        printf "[Vector] circle at (%d,%d) r=%d\n", $x, $y, $radius;
    }

    method render_rect($x, $y, $w, $h) {
        printf "[Vector] rect at (%d,%d) %dx%d\n", $x, $y, $w, $h;
    }
}

class RasterRenderer :isa(IRenderer) {
    method render_circle($x, $y, $radius) {
        printf "[Raster] circle pixels at (%d,%d) r=%d\n", $x, $y, $radius;
    }

    method render_rect($x, $y, $w, $h) {
        printf "[Raster] rect pixels at (%d,%d) %dx%d\n", $x, $y, $w, $h;
    }
}
