use v5.42;

use Facade;

my $facade = OrderFacade->new();
$facade->place_order('wireless keyboard', 2, 'card-4242');
