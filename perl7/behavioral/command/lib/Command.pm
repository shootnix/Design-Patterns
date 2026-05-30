use v5.42;
use feature 'class';
no warnings 'experimental::class';

class Light {
    field $on = 0;
    method turn_on  { $on = 1; print "[Light] on\n" }
    method turn_off { $on = 0; print "[Light] off\n" }
}

class ICommand {
    method execute() { ... }
    method undo()    { ... }
}

class TurnOnCommand :isa(ICommand) {
    field $light :param;
    method execute() { $light->turn_on() }
    method undo()    { $light->turn_off() }
}

class TurnOffCommand :isa(ICommand) {
    field $light :param;
    method execute() { $light->turn_off() }
    method undo()    { $light->turn_on() }
}

class RemoteControl {
    field $history = [];
    method press($cmd) {
        $cmd->execute();
        push @$history, $cmd;
    }
    method undo_last() {
        return unless @$history;
        my $cmd = pop @$history;
        print "[Undo] ";
        $cmd->undo();
    }
}
