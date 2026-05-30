use v5.42;
use Expression;

my $expr = Multiply->new(
    left  => Add->new(left => Number->new(value => 3), right => Number->new(value => 4)),
    right => Number->new(value => 2),
);
printf "= %d\n", $expr->interpret();   # 14

my $expr2 = Subtract->new(
    left  => Number->new(value => 10),
    right => Add->new(left => Number->new(value => 2), right => Number->new(value => 3)),
);
printf "= %d\n", $expr2->interpret();  # 5
