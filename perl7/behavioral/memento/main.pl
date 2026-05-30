use v5.42;
use Memento;

my $editor  = Editor->new();
my $history = History->new();

$editor->type('Hello');      $history->push_snap($editor->save());
$editor->type(', world');    $history->push_snap($editor->save());
$editor->type('!!!');
$editor->print_content();

if (my $m = $history->pop_snap()) { $editor->restore($m); print "[undo] "; $editor->print_content() }
if (my $m = $history->pop_snap()) { $editor->restore($m); print "[undo] "; $editor->print_content() }
