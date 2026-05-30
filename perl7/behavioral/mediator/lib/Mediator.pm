use v5.42;
use feature 'class';
no warnings 'experimental::class';

class ChatRoom {
    field $users = {};

    method register($user) {
        $users->{ $user->name() } = $user;
        $user->join($self);
    }

    method send($from, $message) {
        for my $name (keys %$users) {
            next if $name eq $from;
            $users->{$name}->receive($from, $message);
        }
    }
}

class User {
    field $name     :param;
    field $mediator;

    method name() { $name }

    method join($room) { $mediator = $room }

    method say($message) { $mediator->send($name, $message) }

    method receive($from, $message) {
        printf "[%s] %s: %s\n", $name, $from, $message;
    }
}
