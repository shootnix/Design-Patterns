package BubbleSort;
use v5.34;
sub new  { bless {}, shift }
sub sort {
    my ($self, @data) = @_;
    for my $i (0..$#data) {
        for my $j (0..$#data-$i-1) {
            @data[$j,$j+1] = @data[$j+1,$j] if $data[$j] > $data[$j+1];
        }
    }
    return @data;
}
1;

package StdSort;
use v5.34;
sub new  { bless {}, shift }
sub sort { my ($self, @data) = @_; return sort { $a <=> $b } @data }
1;

package Sorter;
use v5.34;
sub new          { bless { strategy => undef }, shift }
sub set_strategy { $_[0]->{strategy} = $_[1] }
sub sort         { $_[0]->{strategy}->sort(@_[1..$#_]) }
1;
