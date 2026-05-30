use v5.42;
use feature 'class';
no warnings 'experimental::class';

use Subsystems;

class OrderFacade {
    field $inventory = InventoryService->new();
    field $payment   = PaymentService->new();
    field $shipping  = ShippingService->new();

    method place_order($item, $qty, $card) {
        printf "--- placing order: %d x '%s' ---\n", $qty, $item;

        unless ($inventory->reserve($item, $qty)) {
            printf "order failed: out of stock\n";
            return;
        }
        unless ($payment->charge($card, '$99.99')) {
            printf "order failed: payment declined\n";
            return;
        }
        my $tracking = $shipping->ship($item, $qty);
        printf "order complete, tracking: %s\n", $tracking;
    }
}
