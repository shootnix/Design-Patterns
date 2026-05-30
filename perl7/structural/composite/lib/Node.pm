use v5.42;
use feature 'class';
no warnings 'experimental::class';

use Interface;

class File :isa(IFileSystemNode) {
    field $name :param;
    field $size :param;

    method size() { $size }

    method show($indent) {
        printf "%s- %s (%d B)\n", $indent, $name, $size;
    }
}

class Directory :isa(IFileSystemNode) {
    field $name     :param;
    field $children = [];

    method add($node) {
        push @$children, $node;
    }

    method size() {
        my $total = 0;
        $total += $_->size() for @$children;
        return $total;
    }

    method show($indent) {
        printf "%s+ %s/ (%d B)\n", $indent, $name, $self->size();
        $_->show($indent . '  ') for @$children;
    }
}
