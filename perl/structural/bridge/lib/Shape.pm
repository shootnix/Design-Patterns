package Shape;

use v5.34;
use Carp qw/croak/;

sub new {
    my ($class, $renderer) = @_;
    return bless { renderer => $renderer }, $class;
}

sub draw { croak ref(shift) . '::draw not implemented' }

1;
