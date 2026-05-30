use v5.34;
use lib 'lib';
use Strategy;

my @data   = (5, 2, 8, 1, 9, 3);
my $sorter = Sorter->new();

$sorter->set_strategy(BubbleSort->new());
printf "[Bubble] %s\n", join(' ', $sorter->sort(@data));

$sorter->set_strategy(StdSort->new());
printf "[Std   ] %s\n", join(' ', $sorter->sort(@data));
