use v5.34;
use lib 'lib';

use Espresso;
use MilkDecorator;
use SugarDecorator;
use WhipDecorator;

sub print_order {
    my ($b) = @_;
    printf "%s - %d cents\n", $b->description(), $b->cost();
}

my $simple = Espresso->new();
my $latte  = MilkDecorator->new(Espresso->new());
my $fancy  = WhipDecorator->new(SugarDecorator->new(MilkDecorator->new(Espresso->new())));

print_order($simple);
print_order($latte);
print_order($fancy);
