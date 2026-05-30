package Image;

use v5.34;
use Carp qw/croak/;

sub new     { bless {}, shift }
sub display { croak ref(shift) . '::display not implemented' }

1;
