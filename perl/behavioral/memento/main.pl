use v5.34;
use lib 'lib';
use Memento;

my $editor  = Editor->new();
my $history = History->new();

$editor->type('Hello');      $history->push($editor->save());
$editor->type(', world');    $history->push($editor->save());
$editor->type('!!!');
$editor->print();

if (my $m = $history->pop()) { $editor->restore($m); print "[undo] "; $editor->print() }
if (my $m = $history->pop()) { $editor->restore($m); print "[undo] "; $editor->print() }
