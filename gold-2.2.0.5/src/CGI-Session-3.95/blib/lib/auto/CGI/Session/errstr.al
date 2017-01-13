# NOTE: Derived from blib/lib/CGI/Session.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package CGI::Session;

#line 1090 "blib/lib/CGI/Session.pm (autosplit into blib/lib/auto/CGI/Session/errstr.al)"
# errstr() - alias to error()
sub errstr {
    my $self = shift;

    return $self->error(@_);
}

# end of CGI::Session::errstr
1;
