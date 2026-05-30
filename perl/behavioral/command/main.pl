use v5.34;
use lib 'lib';
use Command;

my $light  = Light->new();
my $remote = RemoteControl->new();

$remote->press(TurnOnCommand->new($light));
$remote->press(TurnOffCommand->new($light));
$remote->press(TurnOnCommand->new($light));
$remote->undo_last();
$remote->undo_last();
