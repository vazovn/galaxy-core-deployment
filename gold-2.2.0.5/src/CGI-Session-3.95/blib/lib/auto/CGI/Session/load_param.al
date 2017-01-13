# NOTE: Derived from blib/lib/CGI/Session.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package CGI::Session;

#line 1032 "blib/lib/CGI/Session.pm (autosplit into blib/lib/auto/CGI/Session/load_param.al)"
# load_param() - loads a list of third party object parameters
# such as CGI, into CGI::Session's '_DATA' table
sub load_param {
    my ($self, $cgi, $list) = @_;

    unless ( ref($cgi) ) {
        confess "save_param(): first argument must be an object";

    }
    unless ( $cgi->can('param') ) {
        my $class = ref($cgi);
        confess "save_param(): Cannot call method param() on the object $class";
    }

    my @params = ();
    if ( defined $list ) {
        unless ( ref($list) eq 'ARRAY' ) {
            confess "save_param(): second argument must be an arrayref";
        }
        @params = @{ $list };

    } else {
        @params = $self->param();

    }

    my $n = 0;
    for ( @params ) {
        $cgi->param(-name=>$_, -value=>$self->_get_param($_));
    }
    return $n;
}

# end of CGI::Session::load_param
1;
