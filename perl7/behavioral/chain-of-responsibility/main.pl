use v5.42;

use Handlers;

my $tl = TeamLead->new();
$tl->set_next(Manager->new())->set_next(Director->new())->set_next(VP->new());

$tl->handle($_) for 50, 500, 5000, 50000;
