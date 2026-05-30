use v5.42;
use feature 'class';
no warnings 'experimental::class';

class IHandler {
    method set_next($h) { ... }
    method handle($amount) { ... }
}

class BaseHandler :isa(IHandler) {
    field $next;

    method set_next($h) { $next = $h; return $h }

    method pass($amount) {
        if ($next) { $next->handle($amount) }
        else { printf "  nobody approved \$%d\n", $amount }
    }
}
