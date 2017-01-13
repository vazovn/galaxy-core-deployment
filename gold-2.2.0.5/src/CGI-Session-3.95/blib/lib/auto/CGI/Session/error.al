# NOTE: Derived from blib/lib/CGI/Session.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package CGI::Session;

#line 1078 "blib/lib/CGI/Session.pm (autosplit into blib/lib/auto/CGI/Session/error.al)"
# error() returns/sets error message
sub error {
    my ($self, $msg) = @_;

    if ( defined $msg ) {
        $errstr = $msg;
    }

    return $errstr;
}

# end of CGI::Session::error
1;
