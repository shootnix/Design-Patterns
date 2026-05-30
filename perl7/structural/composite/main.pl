use v5.42;

use Node;

my $root = Directory->new(name => 'root');

my $src = Directory->new(name => 'src');
$src->add(File->new(name => 'main.go',    size => 1200));
$src->add(File->new(name => 'handler.go', size =>  800));

my $assets = Directory->new(name => 'assets');
$assets->add(File->new(name => 'logo.png',  size => 48000));
$assets->add(File->new(name => 'style.css', size =>  3200));

$root->add($src);
$root->add($assets);
$root->add(File->new(name => 'README.md', size => 640));

$root->show('');
