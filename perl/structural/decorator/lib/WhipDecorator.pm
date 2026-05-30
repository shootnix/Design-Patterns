package WhipDecorator;

use v5.34;
use parent 'Beverage';

sub new {
    my ($class, $beverage) = @_;
    return bless { beverage => $beverage }, $class;
}

sub cost        { $_[0]->{beverage}->cost() + 50 }
sub description { $_[0]->{beverage}->description() . ', whip' }

1;
