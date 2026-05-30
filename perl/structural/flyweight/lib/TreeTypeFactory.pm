package TreeTypeFactory;

use v5.34;
use TreeType;

sub new { bless { cache => {} }, shift }

sub get {
    my ($self, $species, $color) = @_;
    my $key = "$species/$color";
    unless (exists $self->{cache}{$key}) {
        $self->{cache}{$key} = TreeType->new($species, $color);
        printf "[Factory] new TreeType: %s\n", $key;
    }
    return $self->{cache}{$key};
}

sub count { scalar keys %{$_[0]->{cache}} }

1;
