# NOTE: Derived from blib/lib/CGI/Session.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package CGI::Session;

#line 1111 "blib/lib/CGI/Session.pm (autosplit into blib/lib/auto/CGI/Session/ctime.al)"
# ctime() - returns session creation time
sub ctime {
    my $self = shift;

    if ( @_ ) {
        confess "_SESSION_ATIME - read-only value";
    }

    return $self->{_DATA}->{_SESSION_CTIME};
}

# end of CGI::Session::ctime
1;
