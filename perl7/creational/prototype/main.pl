use v5.42;

use Shapes;
use Registry;

my $registry = ShapeRegistry->new();
$registry->register('small-red-circle', Circle->new(radius => 5,  color => 'red'));
$registry->register('wide-blue-rect',   Rectangle->new(width => 20, height => 5, color => 'blue'));

my $c1 = $registry->clone('small-red-circle');
my $c2 = $registry->clone('small-red-circle');

$c1->set_color('green');

$c1->describe();  # green: mutation did not affect the prototype
$c2->describe();  # red:   independent copy

my $r1 = $registry->clone('wide-blue-rect');
$r1->describe();
