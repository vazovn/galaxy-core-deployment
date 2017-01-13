# NOTE: Derived from blib/lib/CGI/Session.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package CGI::Session;

#line 1159 "blib/lib/CGI/Session.pm (autosplit into blib/lib/auto/CGI/Session/_time_alias.al)"
# parses such strings as '+1M', '+3w', accepted by expire()
sub _time_alias {
    my ($str) = @_;

    # If $str consists of just digits, return them as they are
    if ( $str =~ m/^\d+$/ ) {
        return $str;
    }

    my %time_map = (
        s           => 1,
        m           => 60,
        h           => 3600,
        d           => 86400,
        w           => 604800,
        M           => 2592000,
        y           => 31536000
    );

    my ($koef, $d) = $str =~ m/^([+-]?\d+)(\w)$/;

    if ( defined($koef) && defined($d) ) {
        return $koef * $time_map{$d};
    }
}

# end of CGI::Session::_time_alias
1;
