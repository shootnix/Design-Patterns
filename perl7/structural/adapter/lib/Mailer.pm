use v5.42;
use feature 'class';
no warnings 'experimental::class';

# Legacy third-party class with an incompatible interface. Cannot be modified.
class SMTPMailer {
    field $host :param;

    method send_email($to, $subject, $body) {
        printf "[SMTP:%s] To: %s | Subject: %s | Body: %s\n",
            $host, $to, $subject, $body;
    }
}
