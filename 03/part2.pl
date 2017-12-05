#! /usr/bin/perl

use strict;
use warnings;

use POSIX;

while(my $line = <>){
    chomp $line;
    print solve($line), "\n";
}

sub sum_surrounding {
    my ($aa, $i, $j) = @_;
    $aa->[$i][$j] = 0
        + $aa->[$i+1][$j+1]
        + $aa->[$i+1][$j]
        + $aa->[$i+1][$j-1]
        + $aa->[$i][$j+1]
        + $aa->[$i][$j-1]
        + $aa->[$i-1][$j+1]
        + $aa->[$i-1][$j]
        + $aa->[$i-1][$j-1];
    # print "Set ($i,$j) = $aa->[$i][$j]\n";
}


sub solve {
    my $n = shift;
    my $aa;
    foreach my $i (0 .. 20) {
        foreach my $j (0 .. 20) {
            $aa->[$i][$j] = 0;
        }
    }
    $aa->[0][0] = 1;
    foreach my $ring (1 .. 4) {
        my $side = $ring * 2;
        # right side (from bottom to top)
        # print "Right\n";
        foreach my $i (1 .. $side) {
            my $x = sum_surrounding($aa, $ring, $i - $ring);
            return $x if $x > $n;
        }
        # top side (from right to left)
        # print "Top\n";
        foreach my $i (reverse 0 .. $side -1) {
            my $x = sum_surrounding($aa, $i - $ring, $ring);
            return $x if $x > $n;
        }
        # left side (from top to bottom)
        # print "Left\n";
        foreach my $i (reverse 0 .. $side -1) {
            my $x = sum_surrounding($aa, -$ring, $i - $ring);
            return $x if $x > $n;
        }
        # bottom side (from left to right)
        # print "Bottom\n";
        foreach my $i (1 .. $side) {
            my $x = sum_surrounding($aa, $i - $ring, -$ring);
            return $x if $x > $n;
        }
    }
    foreach my $i ( reverse(10 .. 20, 0 .. 9) ) {
        foreach my $j ( 10 .. 20, 0 .. 9 ) {
            print $aa->[$j][$i],"\t";
        }
        print "\n";
    }
}
