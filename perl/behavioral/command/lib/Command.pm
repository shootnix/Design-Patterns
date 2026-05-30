package Light {
    use v5.34;

    sub new { bless { on => 0 }, shift }
    sub turn_on  { $_[0]->{on}=1; print "[Light] on\n" }
    sub turn_off { $_[0]->{on}=0; print "[Light] off\n" }
}

package TurnOnCommand {
    use v5.34;
    sub new { bless { light => $_[1] }, $_[0] }
    sub execute { $_[0]->{light}->turn_on() }
    sub undo    { $_[0]->{light}->turn_off() }
}

package TurnOffCommand {
    use v5.34;
    sub new { bless { light => $_[1] }, $_[0] }
    sub execute { $_[0]->{light}->turn_off() }
    sub undo    { $_[0]->{light}->turn_on() }
}

package RemoteControl {
    use v5.34;
    sub new { bless { history => [] }, shift }
    sub press {
        my ($self, $cmd) = @_;
        $cmd->execute();
        push @{$self->{history}}, $cmd;
    }
    sub undo_last {
        my ($self) = @_;
        return unless @{$self->{history}};
        my $cmd = pop @{$self->{history}};
        print "[Undo] ";
        $cmd->undo();
    }
}

1;
