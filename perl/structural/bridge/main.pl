use v5.34;
use lib 'lib';

use VectorRenderer;
use RasterRenderer;
use Circle;
use Rectangle;

my $vector = VectorRenderer->new();
my $raster = RasterRenderer->new();

my @shapes = (
    Circle->new($vector, 5, 10, 20),
    Circle->new($raster, 5, 10, 20),
    Rectangle->new($vector, 0, 0, 100, 50),
    Rectangle->new($raster, 0, 0, 100, 50),
);

$_->draw() for @shapes;
