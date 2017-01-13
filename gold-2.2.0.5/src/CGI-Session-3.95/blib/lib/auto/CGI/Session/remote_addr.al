# NOTE: Derived from blib/lib/CGI/Session.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package CGI::Session;

#line 1186 "blib/lib/CGI/Session.pm (autosplit into blib/lib/auto/CGI/Session/remote_addr.al)"
# remote_addr() - returns ip address of the session
sub remote_addr {
    my $self = shift;

    return $self->{_DATA}->{_SESSION_REMOTE_ADDR};
}

# end of CGI::Session::remote_addr
1;
