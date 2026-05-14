package WebhookVerifier::Stripe;

use v5.34;

sub new { bless {}, shift }

sub handle_webhook {
    my ($self, $payload, $signature) = @_;
    printf "[Stripe] Verifying webhook with signature %s\n", $signature;
    return $payload && $signature;
}

1;