package Shape;

use v5.34;
use Carp qw/croak/;

sub new {
    my ($class, %args) = @_;
    return bless {%args}, $class;
}

sub clone    { croak ref(shift) . '::clone not implemented' }
sub describe { croak ref(shift) . '::describe not implemented' }

1;
