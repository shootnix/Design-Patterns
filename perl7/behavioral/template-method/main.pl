use v5.42;
use Report;

my @rows = ('2024-01-01,100,paid', '2024-01-02,200,pending');

CSVReport->new()->generate(\@rows);
HTMLReport->new()->generate(\@rows);
