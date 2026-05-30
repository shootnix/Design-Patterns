package Notifier;

use v5.34;
use Carp qw/croak/;

sub new { bless {}, shift }

sub notify { croak ref(shift) . '::notify not implemented' }

1;
