# NOTE: Derived from blib/lib/CGI/Session.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package CGI::Session;

#line 983 "blib/lib/CGI/Session.pm (autosplit into blib/lib/auto/CGI/Session/save_param.al)"
# save_param() - copies a list of third party object parameters
# into CGI::Session object's '_DATA' table
sub save_param {
    my ($self, $cgi, $list) = @_;

    unless ( ref($cgi) ) {
        confess "save_param(): first argument should be an object";

    }
    unless ( $cgi->can('param') ) {
        confess "save_param(): Cannot call method param() on the object";
    }

    my @params = ();
    if ( defined $list ) {
        unless ( ref($list) eq 'ARRAY' ) {
            confess "save_param(): second argument must be an arrayref";
        }

        @params = @{ $list };

    } else {
        @params = $cgi->param();

    }

    my $n = 0;
    for ( @params ) {
        # It's imporatnt to note that CGI.pm's param() returns array
        # if a parameter has more values associated with it (checkboxes
        # and crolling lists). So we should access its parameters in
        # array context not to miss anything
        my @values = $cgi->param($_);

        if ( defined $values[1] ) {
            $self->_set_param($_ => \@values);

        } else {
            $self->_set_param($_ => $values[0] );

        }

        ++$n;
    }

    return $n;
}

# end of CGI::Session::save_param
1;
