use v5.34;
use lib 'lib';
use Expression;

# (3 + 4) * 2
my $expr = Multiply->new(Add->new(Number->new(3), Number->new(4)), Number->new(2));
printf "= %d\n", $expr->interpret();   # 14

# 10 - (2 + 3)
my $expr2 = Subtract->new(Number->new(10), Add->new(Number->new(2), Number->new(3)));
printf "= %d\n", $expr2->interpret();  # 5
