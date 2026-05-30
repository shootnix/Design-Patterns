package Directory;

use v5.34;
use parent 'FileSystemNode';

sub new {
    my ($class, $name) = @_;
    return bless { name => $name, children => [] }, $class;
}

sub add {
    my ($self, $node) = @_;
    push @{$self->{children}}, $node;
}

sub size {
    my ($self) = @_;
    my $total = 0;
    $total += $_->size() for @{$self->{children}};
    return $total;
}

sub show {
    my ($self, $indent) = @_;
    printf "%s+ %s/ (%d B)\n", $indent, $self->{name}, $self->size();
    $_->show($indent . '  ') for @{$self->{children}};
}

1;
