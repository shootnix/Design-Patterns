package TrafficLight;
use v5.34;
sub new    { bless { state => RedState->new() }, shift }
sub next   { $_[0]->{state} = $_[0]->{state}->next() }
sub status { printf "Light: %s\n", $_[0]->{state}->status() }
1;

package RedState;
use v5.34;
sub new    { bless {}, shift }
sub next   { GreenState->new() }
sub status { 'RED' }
1;

package GreenState;
use v5.34;
sub new    { bless {}, shift }
sub next   { YellowState->new() }
sub status { 'GREEN' }
1;

package YellowState;
use v5.34;
sub new    { bless {}, shift }
sub next   { RedState->new() }
sub status { 'YELLOW' }
1;
