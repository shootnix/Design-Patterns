use v5.42;
use feature 'class';
no warnings 'experimental::class';

use Flyweight;

class Tree {
    field $x    :param;
    field $y    :param;
    field $type :param;

    method draw() { $type->draw($x, $y) }
}

class Forest {
    field $trees   = [];
    field $factory = TreeTypeFactory->new();

    method plant($x, $y, $species, $color) {
        my $type = $factory->get($species, $color);
        push @$trees, Tree->new(x => $x, y => $y, type => $type);
    }

    method draw() { $_->draw() for @$trees }

    method tree_count() { scalar @$trees }
    method type_count() { $factory->count() }
}
