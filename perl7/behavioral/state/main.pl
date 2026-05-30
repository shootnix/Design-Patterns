use v5.42;
use State;

my $tl = TrafficLight->new();
for (1..6) { $tl->status(); $tl->next() }
