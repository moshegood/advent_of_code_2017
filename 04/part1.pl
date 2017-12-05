#! /usr/bin/perl
use strict;
use warnings;

my $sum = 0;
while(my $line = <>){
    chomp $line;
    my @words = split(' ', $line);
    my %h;
    foreach my $w (@words) {
        $h{$w}++;
    }
    $sum++ if scalar(grep { $_ != 1 } values %h) == 0;
}
print $sum, "\n";
