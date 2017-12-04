#! /usr/bin/perl

use strict;
use warnings;

my @lines = <>;
my $sum = 0;
foreach my $line (@lines) {
    chomp $line;
    my @ns = split(' ', $line);
    my $max = $ns[0];
    my $min = $ns[0];
    foreach my $n (@ns) {
        $max = $n if $n > $max;
        $min = $n if $n < $min;
    }
    $sum += $max - $min;
}
print $sum, "\n";
