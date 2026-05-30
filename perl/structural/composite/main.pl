use v5.34;
use lib 'lib';

use File;
use Directory;

my $root = Directory->new('root');

my $src = Directory->new('src');
$src->add(File->new('main.go',    1200));
$src->add(File->new('handler.go',  800));

my $assets = Directory->new('assets');
$assets->add(File->new('logo.png',  48000));
$assets->add(File->new('style.css',  3200));

$root->add($src);
$root->add($assets);
$root->add(File->new('README.md', 640));

$root->show('');
