use v5.42;
use Visitor;

my @shapes = (
    Circle->new(radius => 5),
    Rectangle->new(width => 10, height => 4),
    Circle->new(radius => 3),
);

my $area = AreaVisitor->new();
$_->accept($area) for @shapes;
printf "total area: %.2f\n\n", $area->total();

my $svg = SVGVisitor->new();
$_->accept($svg) for @shapes;
