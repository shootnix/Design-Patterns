use v5.34;
use lib 'lib';
use OrderFacade;

my $facade = OrderFacade->new();
$facade->place_order('wireless keyboard', 2, 'card-4242');
