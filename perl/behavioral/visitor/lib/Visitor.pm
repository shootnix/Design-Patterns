package Circle;
use v5.34;
sub new    { bless { radius => $_[1] }, $_[0] }
sub accept { $_[1]->visit_circle($_[0]) }
1;

package Rectangle;
use v5.34;
sub new    { bless { width => $_[1], height => $_[2] }, $_[0] }
sub accept { $_[1]->visit_rectangle($_[0]) }
1;

package AreaVisitor;
use v5.34;
sub new   { bless { total => 0 }, shift }
sub visit_circle {
    my ($self, $c) = @_;
    my $area = 3.14159 * $c->{radius} ** 2;
    $self->{total} += $area;
    printf "[Area] circle r=%.1f => %.2f\n", $c->{radius}, $area;
}
sub visit_rectangle {
    my ($self, $r) = @_;
    my $area = $r->{width} * $r->{height};
    $self->{total} += $area;
    printf "[Area] rect %.1fx%.1f => %.2f\n", $r->{width}, $r->{height}, $area;
}
sub total { $_[0]->{total} }
1;

package SVGVisitor;
use v5.34;
sub new              { bless {}, shift }
sub visit_circle     { printf "<circle r=\"%.1f\"/>\n",                     $_[1]->{radius} }
sub visit_rectangle  { printf "<rect width=\"%.1f\" height=\"%.1f\"/>\n",   $_[1]->{width}, $_[1]->{height} }
1;
