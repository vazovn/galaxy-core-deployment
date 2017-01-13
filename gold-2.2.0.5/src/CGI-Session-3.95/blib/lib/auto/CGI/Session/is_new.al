# NOTE: Derived from blib/lib/CGI/Session.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package CGI::Session;

#line 1256 "blib/lib/CGI/Session.pm (autosplit into blib/lib/auto/CGI/Session/is_new.al)"
# to Chris Dolan's request
sub is_new {
	my $self = shift;

	return $self->{_IS_NEW};
}

# $Id: Session.pm,v 3.12.2.7.2.4 2003/07/26 13:49:16 sherzodr Exp $
1;
# end of CGI::Session::is_new
