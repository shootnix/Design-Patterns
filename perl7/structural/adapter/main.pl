use v5.42;

use Mailer;
use Adapter;

my $legacy   = SMTPMailer->new(host => 'mail.example.com');
my $notifier = MailerAdapter->new(mailer => $legacy);

$notifier->notify('alice@example.com', 'your order has shipped');
$notifier->notify('bob@example.com',   'password reset requested');
