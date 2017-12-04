#! /usr/bin/perl

use strict;
use warnings;

while(my $line = <>){
    chomp $line;
    print solve($line), "\n";
}

sub solve {
    my $line = shift;
    my @ns = split('', $line);

    my $sum = 0;
    my $prev = $ns[-1];
    foreach my $current (@ns) {
        $sum += $current if $current == $prev;
        $prev = $current;
    }
    return $sum;
}
