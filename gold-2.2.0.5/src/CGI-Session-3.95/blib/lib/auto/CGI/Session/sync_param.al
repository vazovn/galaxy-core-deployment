# NOTE: Derived from blib/lib/CGI/Session.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package CGI::Session;

#line 1235 "blib/lib/CGI/Session.pm (autosplit into blib/lib/auto/CGI/Session/sync_param.al)"
# sync_param() - synchronizes CGI and Session parameters.
sub sync_param {
    my ($self, $cgi, $list) = @_;

    unless ( ref($cgi) ) {
        confess("$cgi doesn't look like an object");
    }

    unless ( $cgi->UNIVERSAL::can('param') ) {
        confess(ref($cgi) . " doesn't support param() method");
    }

    # we first need to save all the available CGI parameters to the
    # object
    $self->save_param($cgi, $list);

    # we now need to load all the parameters back to the CGI object
    return $self->load_param($cgi, $list);
}

# end of CGI::Session::sync_param
1;
