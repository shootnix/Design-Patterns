use v5.34;
use lib 'lib';
use Forest;

my $forest = Forest->new();

$forest->plant(1, 2, 'oak',   'green');
$forest->plant(5, 8, 'pine',  'dark-green');
$forest->plant(3, 4, 'oak',   'green');       # reuses oak/green
$forest->plant(9, 1, 'birch', 'white');
$forest->plant(2, 7, 'pine',  'dark-green');  # reuses pine/dark-green
$forest->plant(6, 3, 'oak',   'green');       # reuses oak/green

printf "\n";
$forest->draw();
printf "\ntrees: %d  TreeType objects: %d\n",
    $forest->tree_count(), $forest->type_count();
