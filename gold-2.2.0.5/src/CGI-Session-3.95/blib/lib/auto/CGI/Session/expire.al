# NOTE: Derived from blib/lib/CGI/Session.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package CGI::Session;

#line 1123 "blib/lib/CGI/Session.pm (autosplit into blib/lib/auto/CGI/Session/expire.al)"
# expire() - sets/returns session/parameter expiration ticker
sub expire {
    my $self = shift;

    unless ( @_ ) {
        return $self->{_DATA}->{_SESSION_ETIME};
    }

    if ( @_ == 1 ) {
        return $self->{_DATA}->{_SESSION_ETIME} = _time_alias( $_[0] );
    }

    # If we came this far, we'll simply assume user is trying
    # to set an expiration date for a single session parameter.
    my ($param, $etime) = @_;

    # Let's check if that particular session parameter exists
    # in the '_DATA' table. Otherwise, return now!
    defined ($self->{_DATA}->{$param} ) || return;

    if ( $etime eq '-1' ) {
        delete $self->{_DATA}->{_SESSION_EXPIRE_LIST}->{$param};
	$self->{_STATUS} = MODIFIED;
        return;
    }

    $self->{_DATA}->{_SESSION_EXPIRE_LIST}->{$param} = _time_alias( $etime );
}

# end of CGI::Session::expire
1;
