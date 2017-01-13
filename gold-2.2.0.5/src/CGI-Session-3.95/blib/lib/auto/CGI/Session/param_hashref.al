# NOTE: Derived from blib/lib/CGI/Session.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package CGI::Session;

#line 1194 "blib/lib/CGI/Session.pm (autosplit into blib/lib/auto/CGI/Session/param_hashref.al)"
# param_hashref() - returns parameters as a reference to a hash
sub param_hashref {
    my $self = shift;

    return $self->{_DATA};
}

# end of CGI::Session::param_hashref
1;
