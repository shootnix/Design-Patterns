use v5.42;
use feature 'class';
no warnings 'experimental::class';

use Interface;

class RealImage :isa(IImage) {
    field $filename :param;

    ADJUST {
        printf "[RealImage] loading '%s' from disk\n", $filename;
    }

    method display() {
        printf "[RealImage] displaying '%s'\n", $filename;
    }
}

class ImageProxy :isa(IImage) {
    field $filename :param;
    field $real;

    method display() {
        unless ($real) {
            printf "[Proxy] first access -- loading '%s'\n", $filename;
            $real = RealImage->new(filename => $filename);
        }
        $real->display();
    }
}
