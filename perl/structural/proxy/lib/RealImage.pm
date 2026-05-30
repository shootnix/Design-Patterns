package RealImage;

use v5.34;
use parent 'Image';

sub new {
    my ($class, $filename) = @_;
    printf "[RealImage] loading '%s' from disk\n", $filename;
    return bless { filename => $filename }, $class;
}

sub display {
    my ($self) = @_;
    printf "[RealImage] displaying '%s'\n", $self->{filename};
}

1;
