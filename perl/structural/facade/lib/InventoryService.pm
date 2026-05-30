package InventoryService;

use v5.34;

sub new { bless {}, shift }

sub reserve {
    my ($self, $item, $qty) = @_;
    printf "[Inventory] reserving %d x '%s'\n", $qty, $item;
    return 1;
}

1;
