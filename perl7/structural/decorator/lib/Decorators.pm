use v5.42;
use feature 'class';
no warnings 'experimental::class';

use Interface;

class MilkDecorator :isa(IBeverage) {
    field $beverage :param;
    method cost()        { $beverage->cost() + 30 }
    method description() { $beverage->description() . ', milk' }
}

class SugarDecorator :isa(IBeverage) {
    field $beverage :param;
    method cost()        { $beverage->cost() + 10 }
    method description() { $beverage->description() . ', sugar' }
}

class WhipDecorator :isa(IBeverage) {
    field $beverage :param;
    method cost()        { $beverage->cost() + 50 }
    method description() { $beverage->description() . ', whip' }
}
