use v5.42;
use Command;

my $light  = Light->new();
my $remote = RemoteControl->new();

$remote->press(TurnOnCommand->new(light => $light));
$remote->press(TurnOffCommand->new(light => $light));
$remote->press(TurnOnCommand->new(light => $light));
$remote->undo_last();
$remote->undo_last();
