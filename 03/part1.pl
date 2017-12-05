#! /usr/bin/perl

use strict;
use warnings;

use POSIX;

while(my $line = <>){
    chomp $line;
    print solve($line), "\n";
}

sub solve {
    my $n = shift;
    my $ring = ceil((sqrt($n) + 1)/2);
    my $ring_max = ($ring*2 -1)**2;
    my $prev_ring_max = ($ring*2 - 3)**2;
    my $quarter_ring = ($ring_max - $prev_ring_max)/4;

    my $off = $ring_max - $n;
    while($off > $quarter_ring) {
        $off -= $quarter_ring;
    }
    
    return $ring - 1 + abs($quarter_ring/2-$off);
}
