package Memento {
    use v5.34;

    sub new     { bless { content => $_[1] }, $_[0] }
    sub content { $_[0]->{content} }
}

package Editor {
    use v5.34;

    sub new     { bless { content => '' }, shift }
    sub type    { $_[0]->{content} .= $_[1] }
    sub save    { Memento->new($_[0]->{content}) }
    sub restore { $_[0]->{content} = $_[1]->content() }
    sub print   { printf "content: %s\n", $_[0]->{content} }
}

package History {
    use v5.34;
    
    sub new  { bless { stack => [] }, shift }
    sub push { push @{$_[0]->{stack}}, $_[1] }
    sub pop  { pop  @{$_[0]->{stack}} }
}

1;
