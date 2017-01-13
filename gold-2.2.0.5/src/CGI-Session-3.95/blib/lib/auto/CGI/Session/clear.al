# NOTE: Derived from blib/lib/CGI/Session.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package CGI::Session;

#line 950 "blib/lib/CGI/Session.pm (autosplit into blib/lib/auto/CGI/Session/clear.al)"
# clear() - clears a list of parameters off the session's '_DATA' table
sub clear {
    my $self = shift;
    $class   = ref($self);
    
    my @params = ();

    # if there was at least one argument, we take it as a list
    # of params to delete
    if ( @_ ) {
	@params = ref($_[0]) ? @{ $_[0] } : ($_[0]);
    } else {
	@params = $self->param();
    }

    my $n = 0;
    for ( @params ) {
        /^_SESSION_/ and next;
        # If this particular parameter has an expiration ticker,
        # remove it.
        if ( $self->{_DATA}->{_SESSION_EXPIRE_LIST}->{$_} ) {
            delete ( $self->{_DATA}->{_SESSION_EXPIRE_LIST}->{$_} );
        }
        delete ($self->{_DATA}->{$_}) && ++$n;
    }

    # Set the session '_STATUS' flag to MODIFIED
    $self->{_STATUS} = MODIFIED;

    return $n;
}

# end of CGI::Session::clear
1;
