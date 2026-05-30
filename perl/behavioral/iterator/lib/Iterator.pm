package RangeIterator;
use v5.34;

sub new {
    my ($class, $start, $end, $step) = @_;
    return bless { current => $start, end => $end, step => $step }, $class;
}

sub has_next { $_[0]->{current} <= $_[0]->{end} }

sub next {
    my ($self) = @_;
    my $v = $self->{current};
    $self->{current} += $self->{step};
    return $v;
}

1;
