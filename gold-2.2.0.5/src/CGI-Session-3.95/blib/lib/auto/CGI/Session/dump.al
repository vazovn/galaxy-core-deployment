# NOTE: Derived from blib/lib/CGI/Session.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package CGI::Session;

#line 899 "blib/lib/CGI/Session.pm (autosplit into blib/lib/auto/CGI/Session/dump.al)"
# $Id: Session.pm,v 3.12.2.7.2.4 2003/07/26 13:49:16 sherzodr Exp $


# dump() - dumps the session object using Data::Dumper.
# during development it defines global dump().
sub dump {
    my ($self, $file, $indent) = @_;

    require Data::Dumper;
    local $Data::Dumper::Indent = $indent || 2;    

    my $d = new Data::Dumper([$self], [ref $self]);

    if ( defined $file ) {
        unless ( open(FH, '<' . $file) ) {
            unless(open(FH, '>' . $file)) {
                $self->error("Couldn't open $file: $!");
                return undef;
            }
            print FH $d->Dump();
            unless ( CORE::close(FH) ) {
                $self->error("Couldn't dump into $file: $!");
                return undef;
            }
        }
    }
    return $d->Dump();
}

# end of CGI::Session::dump
1;
