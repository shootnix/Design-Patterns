package SeaLogistics;

use v5.34;
use parent 'Logistics';
use Ship;

sub create_transport {
    return Ship->new();
}

1;
