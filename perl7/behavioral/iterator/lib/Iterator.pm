use v5.42;
use feature 'class';
no warnings 'experimental::class';

class IIterator {
    method has_next() { ... }
    method next()     { ... }
}

class RangeIterator :isa(IIterator) {
    field $current :param;
    field $end     :param;
    field $step    :param;

    method has_next() { $current <= $end }

    method next() {
        my $v = $current;
        $current += $step;
        return $v;
    }
}
