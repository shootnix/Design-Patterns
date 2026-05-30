use v5.42;
use feature 'class';
no warnings 'experimental::class';

class Memento {
    field $content :param;
    method content() { $content }
}

class Editor {
    field $content = '';
    method type($text)      { $content .= $text }
    method save()           { Memento->new(content => $content) }
    method restore($m)      { $content = $m->content() }
    method print_content()  { printf "content: %s\n", $content }
}

class History {
    field $stack = [];
    method push_snap($m) { push @$stack, $m }
    method pop_snap()    { pop  @$stack }
}
