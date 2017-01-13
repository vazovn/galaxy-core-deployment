#! /usr/bin/perl -wT
################################################################################
#
# CGI Helper Class
#
# File   :  CGI.pm
# History:  20 APR 2005 [Scott Jackson] initial implementation
#
################################################################################
#                                                                              #
#                              Copyright (c) 2005                              #
#                  Pacific Northwest National Laboratory,                      #
#                         Battelle Memorial Institute.                         #
#                             All rights reserved.                             #
#                                                                              #
################################################################################
#                                                                              #
#     Redistribution and use in source and binary forms, with or without       #
#     modification, are permitted provided that the following conditions       #
#     are met:                                                                 #
#                                                                              #
#     � Redistributions of source code must retain the above copyright         #
#     notice, this list of conditions and the following disclaimer.            #
#                                                                              #
#     � Redistributions in binary form must reproduce the above copyright      #
#     notice, this list of conditions and the following disclaimer in the      #
#     documentation and/or other materials provided with the distribution.     #
#                                                                              #
#     � Neither the name of Battelle nor the names of its contributors         #
#     may be used to endorse or promote products derived from this software    #
#     without specific prior written permission.                               #
#                                                                              #
#     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS      #
#     "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT        #
#     LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS        #
#     FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE           #
#     COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,      #
#     INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,     #
#     BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;         #
#     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER         #
#     CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT       #
#     LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN        #
#     ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE          #
#     POSSIBILITY OF SUCH DAMAGE.                                              #
#                                                                              #
################################################################################
use strict;

=head1 NAME

Gold::CGI - A Helper class for Gold's CGI web-based Graphical User Interface

=head1 DESCRIPTION

The B<Gold::CGI> module is a helper class to provide the CGI environment with distinct log and configuration files.

=head1 EXAMPLES

use Gold::CGI;

=head1 REQUIRES

Perl 5.6

=head1 AUTHOR

Scott Jackson, Scott.Jackson@pnl.gov

=cut

##############################################################################
package Gold::CGI;

use vars
  qw($PREFIX $config $log $quiet $raw $time_division $verbose $VERSION &toHRT &toMFT);
use Carp;
use Exporter;
@Gold::ISA = qw(Exporter);
@Gold::EXPORT =
  qw($config $log $quiet $raw $time_division $verbose $VERSION &toHRT &toMFT);

BEGIN
{
    # Set $PREFIX from Environment variable, Cfg File, or Hard-coded default

    if ($ENV{GOLD_HOME}) { $PREFIX = $ENV{GOLD_HOME}; }
    elsif (-e "/etc/gold.cfg")
    {
        my ($var, $val);
        open(ENV, "/etc/gold.cfg");
        while (<ENV>)
        {
            chomp;       # Remove trailing whitespace
            s/^\s+//;    # Remove leading whitespace
            s/\#.*//;    # Strip off comments
            next unless ($var, $val) = split("[= ]+", $_, 2);
            $ENV{$var} = $val;
        }
        $PREFIX = $ENV{GOLD_HOME};
    }
    else { $PREFIX = "/opt/test_gold/gold"; }

    # Check and untaint $PREFIX
    if ($PREFIX =~ /^([-\/\w.]+)$/) { $PREFIX = $1; }
    else { die "Illegal characters were found in \$PREFIX ($PREFIX)\n"; }
}

use lib "${PREFIX}/lib";
use Log::Log4perl qw(get_logger :levels);
use Data::Properties;
use Gold::Global;
use Gold::Assignment;
use Gold::Condition;
use Gold::Selection;
use Gold::Option;
use Gold::Datum;
use Gold::Request;
use Gold::Response;
use Gold::Message;
use Gold::Reply;
use Gold::Client;

BEGIN
{
    my $configFile = "${PREFIX}/etc/goldg.conf";
    open CONFIG, "$configFile"
      or die(
        "Unable to open config file ($configFile): $!.\nYou may need to set the \$GOLD_HOME environment variable.\n"
      );

    # Read the Config File
    $config = new Data::Properties();
    $config->load(\*CONFIG);
    close CONFIG;

    # Configure Logging
    Log::Log4perl::Logger::create_custom_level("TRACE", "DEBUG")
      unless Log::Log4perl::Level::is_valid("TRACE");
    Log::Log4perl->init("$configFile");
    $log = get_logger("Gold");
    $log->info(
        "$0 (PID $$) Started *******************************************");
}

1;
