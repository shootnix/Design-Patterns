use v5.42;
use feature 'class';
no warnings 'experimental::class';

use Interface;
use Mailer;

class MailerAdapter :isa(INotifier) {
    field $mailer :param;

    method notify($recipient, $message) {
        $mailer->send_email($recipient, 'Notification', $message);
    }
}
