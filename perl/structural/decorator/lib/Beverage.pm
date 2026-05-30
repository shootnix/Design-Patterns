package Beverage;

use v5.34;
use Carp qw/croak/;

sub new         { bless {}, shift }
sub cost        { croak ref(shift) . '::cost not implemented' }
sub description { croak ref(shift) . '::description not implemented' }

1;
