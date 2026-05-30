use v5.42;
use feature 'class';
no warnings 'experimental::class';

class ISortStrategy {
    method sort($data) { ... }
}

class BubbleSort :isa(ISortStrategy) {
    method sort($data) {
        my @out = @$data;
        for my $i (0..$#out) {
            for my $j (0..$#out-$i-1) {
                @out[$j,$j+1] = @out[$j+1,$j] if $out[$j] > $out[$j+1];
            }
        }
        return \@out;
    }
}

class StdSort :isa(ISortStrategy) {
    method sort($data) {
        my @out = sort { $a <=> $b } @$data;
        return \@out;
    }
}

class Sorter {
    field $strategy :param;
    method set_strategy($s) { $strategy = $s }
    method sort($data)      { $strategy->sort($data) }
}
