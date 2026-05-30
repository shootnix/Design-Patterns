use v5.34;
use lib 'lib';
use Iterator;

sub print_all {
    my ($it) = @_;
    while ($it->has_next()) { printf "%d ", $it->next() }
    print "\n";
}

print_all(RangeIterator->new(1, 10, 1));
print_all(RangeIterator->new(0, 20, 2));
