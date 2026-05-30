use v5.34;
use lib 'lib';
use State;

my $tl = TrafficLight->new();
for (1..6) { $tl->status(); $tl->next() }
