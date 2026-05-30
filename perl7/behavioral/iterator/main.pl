use v5.42;
use Iterator;

sub print_all($it) {
    while ($it->has_next()) { printf "%d ", $it->next() }
    print "\n";
}

print_all(RangeIterator->new(current => 1,  end => 10, step => 1));
print_all(RangeIterator->new(current => 0,  end => 20, step => 2));
