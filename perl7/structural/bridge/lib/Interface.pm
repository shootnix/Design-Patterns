use v5.42;
use feature 'class';
no warnings 'experimental::class';

class IRenderer {
    method render_circle($x, $y, $radius) { ... }
    method render_rect($x, $y, $w, $h)   { ... }
}

class IShape {
    method draw() { ... }
}
