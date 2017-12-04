#! /usr/bin/perl

use strict;
use warnings;

my @lines = <>;
my $sum = 0;
foreach my $line (@lines) {
    chomp $line;
    my @ns = split(' ', $line);
    my @sorted = sort { $a <=> $b } @ns;
    foreach my $bigger (@sorted) {
        foreach my $smaller (@sorted) {
            last if $smaller >= $bigger;
            my $ratio = $bigger / $smaller;
            $sum += $ratio if $ratio == int($ratio);
        }
    }
}
print $sum, "\n";
