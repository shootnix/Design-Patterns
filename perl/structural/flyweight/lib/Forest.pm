package Forest;

use v5.34;
use TreeTypeFactory;

sub new {
    my ($class) = @_;
    return bless { trees => [], factory => TreeTypeFactory->new() }, $class;
}

sub plant {
    my ($self, $x, $y, $species, $color) = @_;
    my $type = $self->{factory}->get($species, $color);
    push @{$self->{trees}}, { x => $x, y => $y, type => $type };
}

sub draw {
    my ($self) = @_;
    for my $tree (@{$self->{trees}}) {
        $tree->{type}->draw($tree->{x}, $tree->{y});
    }
}

sub tree_count { scalar @{$_[0]->{trees}} }
sub type_count { $_[0]->{factory}->count() }

1;
