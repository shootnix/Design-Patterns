use v5.42;
use feature 'class';
no warnings 'experimental::class';

class PaymentProviderFactory {
    use Carp qw/croak/;
    use Stripe;

    sub create($class, $provider) {
        return StripeFactory->new() if $provider eq 'stripe';
        croak "panic: unsupported provider: $provider";
    }
}