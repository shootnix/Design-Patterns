use v5.42;
use feature 'class';
no warnings 'experimental::class';

use Interface;

class TeamLead :isa(BaseHandler) {
    method handle($amount) {
        $amount <= 100
            ? printf("[TeamLead] approved \$%d\n", $amount)
            : $self->pass($amount);
    }
}

class Manager :isa(BaseHandler) {
    method handle($amount) {
        $amount <= 1000
            ? printf("[Manager] approved \$%d\n", $amount)
            : $self->pass($amount);
    }
}

class Director :isa(BaseHandler) {
    method handle($amount) {
        $amount <= 10000
            ? printf("[Director] approved \$%d\n", $amount)
            : $self->pass($amount);
    }
}

class VP :isa(BaseHandler) {
    method handle($amount) { printf "[VP] approved \$%d\n", $amount }
}
