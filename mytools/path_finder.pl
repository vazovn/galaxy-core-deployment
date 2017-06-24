#!/usr/bin/perl -w

# usage : perl toolExample.pl <FASTA file> <output file>

open (OUT, ">$ARGV[0]");
$path = `echo \$PATH`;
$user = `id`;
$env = `env |grep PATH`;
print OUT "\$PATH is: $path \n";
print OUT "user is:  $user\n";
print OUT "PATH aus env ist: $env\n";


#close( IN );
close( OUT );
