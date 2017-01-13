# NOTE: Derived from blib/lib/CGI/Session.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package CGI::Session;

#line 1202 "blib/lib/CGI/Session.pm (autosplit into blib/lib/auto/CGI/Session/name.al)"
# name() - returns the cookie name associated with the session id
sub name {
    my ($class, $name)  = @_;

    if ( defined $name ) {
        $CGI::Session::NAME = $name;
    }

    return $CGI::Session::NAME;
}

# end of CGI::Session::name
1;
