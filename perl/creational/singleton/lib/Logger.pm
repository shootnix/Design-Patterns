package Logger;

use v5.34;

my $instance;

sub get_instance {
    $instance //= bless { entries => [] }, 'Logger';
    return $instance;
}

sub log {
    my ($self, $message) = @_;
    push @{$self->{entries}}, $message;
    printf "[LOG] %s\n", $message;
}

sub entries { @{$_[0]->{entries}} }

1;
