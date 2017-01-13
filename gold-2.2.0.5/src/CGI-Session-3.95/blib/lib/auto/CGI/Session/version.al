# NOTE: Derived from blib/lib/CGI/Session.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package CGI::Session;

#line 930 "blib/lib/CGI/Session.pm (autosplit into blib/lib/auto/CGI/Session/version.al)"
sub version {   return $VERSION   }


# delete() - sets the '_STATUS' session flag to DELETED,
# which flush() uses to decide to call remove() method on driver.
# end of CGI::Session::version
1;
