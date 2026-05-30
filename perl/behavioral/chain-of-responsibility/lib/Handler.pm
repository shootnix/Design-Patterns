package Handler;
use v5.34;
use Carp qw/croak/;

sub new  { bless { next => undef }, shift }
sub handle { croak ref(shift) . '::handle not implemented' }

sub set_next {
    my ($self, $h) = @_;
    $self->{next} = $h;
    return $h;
}

sub _pass {
    my ($self, $amount) = @_;
    if ($self->{next}) { $self->{next}->handle($amount) }
    else { printf "  nobody approved \$%d\n", $amount }
}

1;
