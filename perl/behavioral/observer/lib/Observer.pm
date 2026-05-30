package StockMarket {
    use v5.34;
    sub new { bless { observers => [], prices => {} }, shift }
    sub subscribe   { push @{$_[0]->{observers}}, $_[1] }
    sub unsubscribe { $_[0]->{observers} = [grep { $_ != $_[1] } @{$_[0]->{observers}}] }
    sub notify      { $_->update($_[1], $_[2]) for @{$_[0]->{observers}} }
    sub set_price   { $_[0]->{prices}{$_[1]} = $_[2]; $_[0]->notify($_[1], $_[2]) }
}

package Investor {
    use v5.34;
    sub new    { bless { name => $_[1] }, $_[0] }
    sub update { printf "[%s] %s is now \$%.2f\n", $_[0]->{name}, $_[1], $_[2] }
}

package PriceMonitor {
    use v5.34;
    sub new    { bless {}, shift }
    sub update { printf "[Monitor] %s: \$%.2f\n", $_[1], $_[2] }
}
1;
