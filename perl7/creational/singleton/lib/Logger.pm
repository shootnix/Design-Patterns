use v5.42;
use feature 'class';
no warnings 'experimental::class';

class Logger {
    my $instance;

    sub get_instance($class) {
        $instance //= $class->new();
        return $instance;
    }

    field $entries = [];

    method log($message) {
        push @$entries, $message;
        printf "[LOG] %s\n", $message;
    }

    method entries() {
        return @$entries;
    }
}
