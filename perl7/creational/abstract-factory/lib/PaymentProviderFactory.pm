use v5.42;
use feature 'class';
no warnings 'experimental::class';

class PaymentProviderFactory {
    use Carp qw/croak/;
    use Stripe;
    use PayPal;

    sub create($class, $provider) {
        return StripeFactory->new() if $provider eq 'stripe';
        return PayPalFactory->new() if $provider eq 'paypal';
        croak "panic: unsupported provider: $provider";
    }
}