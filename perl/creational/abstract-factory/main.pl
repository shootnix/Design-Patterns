use v5.34;

use PaymentProviderFactory;
use CheckoutService;


my $factory = PaymentProviderFactory->new("stripe");
my $checkout = CheckoutService->new($factory);
$checkout->checkout(999);
$checkout->refund("trx-123");
$checkout->handle_webhook('{"result":"ok"}', "valid_signature");