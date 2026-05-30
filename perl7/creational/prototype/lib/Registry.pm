use v5.42;
use feature 'class';
no warnings 'experimental::class';

class ShapeRegistry {
    field $prototypes = {};

    method register($name, $shape) {
        $prototypes->{$name} = $shape;
    }

    method clone($name) {
        my $proto = $prototypes->{$name}
            or die "unknown prototype: $name\n";
        return $proto->clone();
    }
}
