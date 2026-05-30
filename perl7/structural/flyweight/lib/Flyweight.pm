use v5.42;
use feature 'class';
no warnings 'experimental::class';

class TreeType {
    field $species :param;
    field $color   :param;

    method draw($x, $y) {
        printf "[%s/%s] at (%d,%d)\n", $species, $color, $x, $y;
    }
}

class TreeTypeFactory {
    field $cache = {};

    method get($species, $color) {
        my $key = "$species/$color";
        unless (exists $cache->{$key}) {
            $cache->{$key} = TreeType->new(species => $species, color => $color);
            printf "[Factory] new TreeType: %s\n", $key;
        }
        return $cache->{$key};
    }

    method count() { scalar keys %$cache }
}
