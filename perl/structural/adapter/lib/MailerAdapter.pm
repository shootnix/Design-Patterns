package MailerAdapter;

use v5.34;
use parent 'Notifier';

sub new {
    my ($class, $mailer) = @_;
    return bless { mailer => $mailer }, $class;
}

sub notify {
    my ($self, $recipient, $message) = @_;
    $self->{mailer}->send_email($recipient, 'Notification', $message);
}

1;
