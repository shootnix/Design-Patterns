use v5.42;

use Logger;

my $a = Logger->get_instance();
my $b = Logger->get_instance();

$a->log('starting application');
$b->log('connecting to database');
$a->log('request received');

printf "same instance: %s\n", ($a == $b ? 'true' : 'false');
printf "total entries: %d\n", scalar $a->entries();
