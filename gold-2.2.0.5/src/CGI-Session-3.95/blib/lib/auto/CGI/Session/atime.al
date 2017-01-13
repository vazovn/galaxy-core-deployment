# NOTE: Derived from blib/lib/CGI/Session.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package CGI::Session;

#line 1099 "blib/lib/CGI/Session.pm (autosplit into blib/lib/auto/CGI/Session/atime.al)"
# atime() - rerturns session last access time
sub atime {
    my $self = shift;

    if ( @_ ) {
        confess "_SESSION_ATIME - read-only value";
    }

    return $self->{_DATA}->{_SESSION_ATIME};
}

# end of CGI::Session::atime
1;
