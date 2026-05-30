use v5.42;
use feature 'class';
no warnings 'experimental::class';

class IReport {
    method header()    { ... }
    method body($rows) { ... }
    method footer()    { ... }

    method generate($rows) {
        printf "%s\n", $self->header();
        printf "%s\n", $self->body($rows);
        printf "%s\n", $self->footer();
    }
}

class CSVReport :isa(IReport) {
    method header()    { 'date,amount,status' }
    method body($rows) { join("\n", @$rows) }
    method footer()    { sprintf '# %d records', 0 }
}

class HTMLReport :isa(IReport) {
    method header() {
        '<table><thead><tr><th>date</th><th>amount</th><th>status</th></tr></thead><tbody>'
    }
    method body($rows) {
        join('', map { "  <tr><td>$_</td></tr>\n" } @$rows)
    }
    method footer() { '</tbody></table>' }
}
