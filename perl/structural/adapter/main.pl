use v5.34;
use lib 'lib';

use Notifier;
use SMTPMailer;
use MailerAdapter;

my $legacy   = SMTPMailer->new('mail.example.com');
my $notifier = MailerAdapter->new($legacy);

$notifier->notify('alice@example.com', 'your order has shipped');
$notifier->notify('bob@example.com',   'password reset requested');
