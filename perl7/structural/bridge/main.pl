use v5.42;

use Renderers;
use Shapes;

my $vector = VectorRenderer->new();
my $raster = RasterRenderer->new();

my @shapes = (
    Circle->new(renderer => $vector, x => 5, y => 10, radius => 20),
    Circle->new(renderer => $raster, x => 5, y => 10, radius => 20),
    Rectangle->new(renderer => $vector, x => 0, y => 0, w => 100, h => 50),
    Rectangle->new(renderer => $raster, x => 0, y => 0, w => 100, h => 50),
);

$_->draw() for @shapes;
