use v5.42;
use Mediator;

my $room  = ChatRoom->new();
my $alice = User->new(name => 'Alice');
my $bob   = User->new(name => 'Bob');
my $carol = User->new(name => 'Carol');

$room->register($_) for $alice, $bob, $carol;

$alice->say('hello everyone');
$bob->say('hi Alice!');
