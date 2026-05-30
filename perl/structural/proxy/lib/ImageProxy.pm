package ImageProxy;

use v5.34;
use parent 'Image';
use RealImage;

sub new {
    my ($class, $filename) = @_;
    return bless { filename => $filename, real => undef }, $class;
}

sub display {
    my ($self) = @_;
    unless ($self->{real}) {
        printf "[Proxy] first access -- loading '%s'\n", $self->{filename};
        $self->{real} = RealImage->new($self->{filename});
    }
    $self->{real}->display();
}

1;
