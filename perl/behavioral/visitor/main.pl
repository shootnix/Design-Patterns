use v5.34;
use lib 'lib';
use Visitor;

my @shapes = (Circle->new(5), Rectangle->new(10, 4), Circle->new(3));

my $area = AreaVisitor->new();
$_->accept($area) for @shapes;
printf "total area: %.2f\n\n", $area->total();

my $svg = SVGVisitor->new();
$_->accept($svg) for @shapes;
