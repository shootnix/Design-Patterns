use v5.42;
use feature 'class';
no warnings 'experimental::class';

use Interface;

class Circle :isa(IShape) {
    field $radius :param;
    field $color  :param;

    method set_color($c) { $color = $c }

    method clone() {
        return Circle->new(radius => $radius, color => $color);
    }

    method describe() {
        printf "Circle{radius: %.1f, color: %s}\n", $radius, $color;
    }
}

class Rectangle :isa(IShape) {
    field $width  :param;
    field $height :param;
    field $color  :param;

    method clone() {
        return Rectangle->new(width => $width, height => $height, color => $color);
    }

    method describe() {
        printf "Rectangle{width: %.1f, height: %.1f, color: %s}\n", $width, $height, $color;
    }
}
