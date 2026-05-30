use v5.42;

use Coffee;
use Decorators;

sub print_order($b) {
    printf "%s - %d cents\n", $b->description(), $b->cost();
}

my $simple = Espresso->new();
my $latte  = MilkDecorator->new(beverage => Espresso->new());
my $fancy  = WhipDecorator->new(
    beverage => SugarDecorator->new(
        beverage => MilkDecorator->new(
            beverage => Espresso->new()
        )
    )
);

print_order($simple);
print_order($latte);
print_order($fancy);
