package Renderer;

use v5.34;
use Carp qw/croak/;

sub new { bless {}, shift }
sub render_circle { croak ref(shift) . '::render_circle not implemented' }
sub render_rect   { croak ref(shift) . '::render_rect not implemented' }

1;
