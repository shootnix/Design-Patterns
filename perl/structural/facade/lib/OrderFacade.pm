package OrderFacade;

use v5.34;
use InventoryService;
use PaymentService;
use ShippingService;

sub new {
    my ($class) = @_;
    return bless {
        inventory => InventoryService->new(),
        payment   => PaymentService->new(),
        shipping  => ShippingService->new(),
    }, $class;
}

sub place_order {
    my ($self, $item, $qty, $card) = @_;
    printf "--- placing order: %d x '%s' ---\n", $qty, $item;

    unless ($self->{inventory}->reserve($item, $qty)) {
        printf "order failed: out of stock\n";
        return;
    }
    unless ($self->{payment}->charge($card, '$99.99')) {
        printf "order failed: payment declined\n";
        return;
    }
    my $tracking = $self->{shipping}->ship($item, $qty);
    printf "order complete, tracking: %s\n", $tracking;
}

1;
