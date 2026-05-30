use v5.42;

use PaymentProviderFactory;
use CheckoutService;

my $factory = PaymentProviderFactory->create('paypal');
my $checkout = CheckoutService->new(factory => $factory);

$checkout->checkout(999);
$checkout->refund("trx-123");
$checkout->handle_webhook('{"result":"ok"}', "valid_signature");