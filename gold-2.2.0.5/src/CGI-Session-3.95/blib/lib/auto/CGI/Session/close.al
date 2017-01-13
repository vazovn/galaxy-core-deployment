# NOTE: Derived from blib/lib/CGI/Session.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package CGI::Session;

#line 1068 "blib/lib/CGI/Session.pm (autosplit into blib/lib/auto/CGI/Session/close.al)"
# another, but a less efficient alternative to undefining
# the object
sub close {
    my $self = shift;

    $self->DESTROY();
}

# end of CGI::Session::close
1;
