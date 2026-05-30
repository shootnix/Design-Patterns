package File;

use v5.34;
use parent 'FileSystemNode';

sub new {
    my ($class, $name, $size) = @_;
    return bless { name => $name, size => $size }, $class;
}

sub size { $_[0]->{size} }

sub show {
    my ($self, $indent) = @_;
    printf "%s- %s (%d B)\n", $indent, $self->{name}, $self->{size};
}

1;
