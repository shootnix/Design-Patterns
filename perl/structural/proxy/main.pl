use v5.34;
use lib 'lib';
use ImageProxy;

my $img = ImageProxy->new('photo.jpg');

printf "proxy created, image not loaded yet\n";

printf "\n";
$img->display();

printf "\n";
$img->display();

printf "\n";
$img->display();
