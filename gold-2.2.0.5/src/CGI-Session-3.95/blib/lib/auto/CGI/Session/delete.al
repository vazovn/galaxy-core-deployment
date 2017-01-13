# NOTE: Derived from blib/lib/CGI/Session.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package CGI::Session;

#line 935 "blib/lib/CGI/Session.pm (autosplit into blib/lib/auto/CGI/Session/delete.al)"
sub delete {
    my $self = shift;

    # If it was already deleted, make a confession!
    if ( $self->{_STATUS} == DELETED ) {
        confess "delete attempt on deleted session";
    }

    $self->{_STATUS} = DELETED;
}

# end of CGI::Session::delete
1;
