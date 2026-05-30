use v5.42;
use feature 'class';
no warnings 'experimental::class';

class InventoryService {
    method reserve($item, $qty) {
        printf "[Inventory] reserving %d x '%s'\n", $qty, $item;
        return 1;
    }
}

class PaymentService {
    method charge($card, $amount) {
        printf "[Payment] charging %s to card %s\n", $amount, $card;
        return 1;
    }
}

class ShippingService {
    method ship($item, $qty) {
        my $tracking = 'TRK-12345';
        printf "[Shipping] shipping %d x '%s', tracking: %s\n", $qty, $item, $tracking;
        return $tracking;
    }
}
