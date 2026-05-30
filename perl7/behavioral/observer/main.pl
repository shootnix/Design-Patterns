use v5.42;
use Observer;

my $market  = StockMarket->new();
my $alice   = Investor->new(name => 'Alice');
my $bob     = Investor->new(name => 'Bob');
my $monitor = PriceMonitor->new();

$market->subscribe($_) for $alice, $bob, $monitor;
$market->set_price('AAPL', 182.50);

$market->unsubscribe($bob);
$market->set_price('AAPL', 185.00);
