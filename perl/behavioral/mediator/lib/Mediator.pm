package ChatRoom {
    use v5.34;

    sub new { bless { users => {} }, shift }

    sub register {
        my ($self, $user) = @_;
        $self->{users}{$user->{name}} = $user;
        $user->{mediator} = $self;
    }

    sub send {
        my ($self, $from, $message) = @_;
        for my $name (keys %{$self->{users}}) {
            next if $name eq $from;
            $self->{users}{$name}->receive($from, $message);
        }
    }
}

package User {
    use v5.34;

    sub new { bless { name => $_[1], mediator => undef }, $_[0] }

    sub say {
        my ($self, $message) = @_;
        $self->{mediator}->send($self->{name}, $message);
    }

    sub receive {
        my ($self, $from, $message) = @_;
        printf "[%s] %s: %s\n", $self->{name}, $from, $message;
    }
}

1;
