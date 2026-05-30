package PaymentProviderFactory;

use v5.34;
use Carp qw/croak/;
use Factory::Stripe;
use Factory::PayPal;

sub new {
    my ($class, $provider) = @_;
    return Factory::Stripe->new() if $provider eq 'stripe';
    return Factory::PayPal->new() if $provider eq 'paypal';
    croak "Unsuppoted provider: $provider";
}


1;