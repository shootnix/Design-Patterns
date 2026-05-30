use v5.42;

use Image;

my $img = ImageProxy->new(filename => 'photo.jpg');

printf "proxy created, image not loaded yet\n";

printf "\n";
$img->display();

printf "\n";
$img->display();

printf "\n";
$img->display();
