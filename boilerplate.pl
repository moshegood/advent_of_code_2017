#! /usr/bin/perl

use strict;
use warnings;

while(my $line = <>){
    chomp $line;
    print solve($line), "\n";
}

sub solve {
    return 42;
}
