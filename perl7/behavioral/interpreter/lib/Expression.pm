use v5.42;
use feature 'class';
no warnings 'experimental::class';

class IExpression {
    method interpret() { ... }
}

class Number :isa(IExpression) {
    field $value :param;
    method interpret() { $value }
}

class Add :isa(IExpression) {
    field $left  :param;
    field $right :param;
    method interpret() { $left->interpret() + $right->interpret() }
}

class Multiply :isa(IExpression) {
    field $left  :param;
    field $right :param;
    method interpret() { $left->interpret() * $right->interpret() }
}

class Subtract :isa(IExpression) {
    field $left  :param;
    field $right :param;
    method interpret() { $left->interpret() - $right->interpret() }
}
