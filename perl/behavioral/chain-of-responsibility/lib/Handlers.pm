package TeamLead { 
    use v5.34; 
    use parent 'Handler';
    
    sub handle { 
        my ($s, $a) = @_; 
        $a <= 100 ? printf("[TeamLead] approved \$%d\n",$a) : $s->_pass($a) 
    }
}

package Manager { 
    use v5.34; 
    use parent 'Handler';

    sub handle { 
        my ($s, $a) = @_; 
        $a <= 1000 ? printf("[Manager] approved \$%d\n",$a) : $s->_pass($a)
    }
}

package Director {
    use v5.34; 
    use parent 'Handler';
    
    sub handle { 
        my ($s, $a) = @_; 
        $a <= 10000 ? printf("[Director] approved \$%d\n",$a) : $s->_pass($a) 
    }
}

package VP {
    use v5.34; 
    use parent 'Handler';
    
    sub handle { printf "[VP] approved \$%d\n", $_[1] }
}

1;
