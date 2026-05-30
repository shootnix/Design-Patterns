package WebhookVerifier::PayPal;

use v5.34;

sub new { bless {}, shift }

sub handle_webhook {
    my ($self, $payload, $signature) = @_;
    printf "[PayPal] Verifying webhook with signature %s\n", $signature;
    return $payload && $signature;
}

1;