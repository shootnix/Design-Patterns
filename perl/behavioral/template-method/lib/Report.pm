package Report;
use v5.34;
use Carp qw/croak/;

sub new    { bless {}, shift }
sub header { croak ref(shift) . '::header not implemented' }
sub body   { croak ref(shift) . '::body not implemented' }
sub footer { croak ref(shift) . '::footer not implemented' }

sub generate {
    my ($self, @rows) = @_;
    print $self->header(), "\n";
    print $self->body(@rows), "\n";
    print $self->footer(), "\n";
}

1;

package CSVReport;
use v5.34;
use parent 'Report';
sub header { "date,amount,status" }
sub body   { my ($self, @rows) = @_; join("\n", @rows) }
sub footer { sprintf "# %d records", 0 }
1;

package HTMLReport;
use v5.34;
use parent 'Report';
sub header { "<table><thead><tr><th>date</th><th>amount</th><th>status</th></tr></thead><tbody>" }
sub body {
    my ($self, @rows) = @_;
    join('', map { "  <tr><td>$_</td></tr>\n" } @rows);
}
sub footer { "</tbody></table>" }
1;
