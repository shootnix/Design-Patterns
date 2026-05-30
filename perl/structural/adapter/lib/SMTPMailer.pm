package SMTPMailer;

# Legacy third-party class with an incompatible interface. Cannot be modified.

use v5.34;

sub new {
    my ($class, $host) = @_;
    return bless { host => $host }, $class;
}

sub send_email {
    my ($self, $to, $subject, $body) = @_;
    printf "[SMTP:%s] To: %s | Subject: %s | Body: %s\n",
        $self->{host}, $to, $subject, $body;
}

1;
