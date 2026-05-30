use v5.42;
use feature 'class';
no warnings 'experimental::class';

use Interface;

class Circle :isa(IShape) {
    field $renderer :param;
    field $x        :param;
    field $y        :param;
    field $radius   :param;

    method draw() {
        $renderer->render_circle($x, $y, $radius);
    }
}

class Rectangle :isa(IShape) {
    field $renderer :param;
    field $x        :param;
    field $y        :param;
    field $w        :param;
    field $h        :param;

    method draw() {
        $renderer->render_rect($x, $y, $w, $h);
    }
}
