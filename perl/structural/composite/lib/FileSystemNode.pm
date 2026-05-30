package FileSystemNode;

use v5.34;
use Carp qw/croak/;

sub new  { bless {}, shift }
sub size { croak ref(shift) . '::size not implemented' }
sub show { croak ref(shift) . '::show not implemented' }

1;
