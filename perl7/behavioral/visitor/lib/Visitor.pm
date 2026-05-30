use v5.42;
use feature 'class';
no warnings 'experimental::class';

class IVisitor {
    method visit_circle($c)    { ... }
    method visit_rectangle($r) { ... }
}

class IShape {
    method accept($v) { ... }
}

class Circle :isa(IShape) {
    field $radius :param;
    method radius()    { $radius }
    method accept($v)  { $v->visit_circle($self) }
}

class Rectangle :isa(IShape) {
    field $width  :param;
    field $height :param;
    method width()    { $width }
    method height()   { $height }
    method accept($v) { $v->visit_rectangle($self) }
}

class AreaVisitor :isa(IVisitor) {
    field $total = 0;
    method total() { $total }
    method visit_circle($c) {
        my $area = 3.14159 * $c->radius() ** 2;
        $total += $area;
        printf "[Area] circle r=%.1f => %.2f\n", $c->radius(), $area;
    }
    method visit_rectangle($r) {
        my $area = $r->width() * $r->height();
        $total += $area;
        printf "[Area] rect %.1fx%.1f => %.2f\n", $r->width(), $r->height(), $area;
    }
}

class SVGVisitor :isa(IVisitor) {
    method visit_circle($c) {
        printf "<circle r=\"%.1f\"/>\n", $c->radius();
    }
    method visit_rectangle($r) {
        printf "<rect width=\"%.1f\" height=\"%.1f\"/>\n", $r->width(), $r->height();
    }
}
