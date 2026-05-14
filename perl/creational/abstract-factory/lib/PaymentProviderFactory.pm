package PaymentProviderFactory;

use v5.34;
use Carp qw/croak/;
use Factory::Stripe;

sub new {
    my ($class, $provider) = @_;
    return Factory::Stripe->new() if $provider eq 'stripe';
    croak "Unsuppoted provider: $provider";
}


1;