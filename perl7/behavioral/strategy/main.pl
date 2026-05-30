use v5.42;
use Strategy;

my @data   = (5, 2, 8, 1, 9, 3);
my $sorter = Sorter->new(strategy => BubbleSort->new());

printf "[Bubble] %s\n", join(' ', @{ $sorter->sort(\@data) });

$sorter->set_strategy(StdSort->new());
printf "[Std   ] %s\n", join(' ', @{ $sorter->sort(\@data) });
