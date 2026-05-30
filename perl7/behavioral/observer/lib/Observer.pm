use v5.42;
use feature 'class';
no warnings 'experimental::class';

class IObserver {
    method update($symbol, $price) { ... }
}

class Investor :isa(IObserver) {
    field $name :param;
    method update($symbol, $price) {
        printf "[%s] %s is now \$%.2f\n", $name, $symbol, $price;
    }
}

class PriceMonitor :isa(IObserver) {
    method update($symbol, $price) {
        printf "[Monitor] %s: \$%.2f\n", $symbol, $price;
    }
}

class StockMarket {
    field $observers = [];
    field $prices    = {};

    method subscribe($o)   { push @$observers, $o }
    method unsubscribe($o) { $observers = [grep { $_ != $o } @$observers] }
    method notify($symbol, $price) { $_->update($symbol, $price) for @$observers }
    method set_price($symbol, $price) {
        $prices->{$symbol} = $price;
        $self->notify($symbol, $price);
    }
}
