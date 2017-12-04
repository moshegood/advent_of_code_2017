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
    my $length = scalar @ns;
    my $other_index = -$length / 2;
    foreach my $current (@ns) {
        $sum += $current if $current == $ns[$other_index];
        $other_index++;
    }
    return $sum;
}
