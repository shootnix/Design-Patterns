package SugarDecorator;

use v5.34;
use parent 'Beverage';

sub new {
    my ($class, $beverage) = @_;
    return bless { beverage => $beverage }, $class;
}

sub cost        { $_[0]->{beverage}->cost() + 10 }
sub description { $_[0]->{beverage}->description() . ', sugar' }

1;
