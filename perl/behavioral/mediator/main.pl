use v5.34;
use lib 'lib';
use Mediator;

my $room  = ChatRoom->new();
my $alice = User->new('Alice');
my $bob   = User->new('Bob');
my $carol = User->new('Carol');

$room->register($_) for $alice, $bob, $carol;

$alice->say('hello everyone');
$bob->say('hi Alice!');
