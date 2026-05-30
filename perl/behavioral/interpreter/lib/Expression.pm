package Number {
    use v5.34;
    sub new { bless { value => $_[1] }, $_[0] }
    sub interpret { $_[0]->{value} }
}

package Add {
    use v5.34;
    sub new { bless { left => $_[1], right => $_[2] }, $_[0] }
    sub interpret { $_[0]->{left}->interpret() + $_[0]->{right}->interpret() }
}

package Multiply {
    use v5.34;
    sub new { bless { left => $_[1], right => $_[2] }, $_[0] }
    sub interpret { $_[0]->{left}->interpret() * $_[0]->{right}->interpret() }
}

package Subtract {
    use v5.34;
    sub new { bless { left => $_[1], right => $_[2] }, $_[0] }
    sub interpret { $_[0]->{left}->interpret() - $_[0]->{right}->interpret() }
}

1;
