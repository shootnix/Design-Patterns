use v5.42;
use feature 'class';
no warnings 'experimental::class';

use Interface;

class Espresso :isa(IBeverage) {
    method cost()        { 200 }
    method description() { 'Espresso' }
}
