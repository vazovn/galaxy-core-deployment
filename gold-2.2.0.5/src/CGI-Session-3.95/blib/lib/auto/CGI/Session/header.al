# NOTE: Derived from blib/lib/CGI/Session.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package CGI::Session;

#line 1214 "blib/lib/CGI/Session.pm (autosplit into blib/lib/auto/CGI/Session/header.al)"
# header() - replacement for CGI::header() method
sub header {
    my $self = shift;

    my $cgi = $self->{_SESSION_OBJ};
    unless ( defined $cgi ) {
        require CGI;
        $self->{_SESSION_OBJ} = CGI->new();
        return $self->header();
    }

    my $cookie = $cgi->cookie($self->name(), $self->id() );

    return $cgi->header(
        -type   => 'text/html',
        -cookie => $cookie,
        @_
    );
}

# end of CGI::Session::header
1;
