#! /usr/bin/perl
use strict;
use warnings;

my @lines = <>;
foreach (@lines) { chomp; }
my $length = scalar @lines;

my $pos = 0;
my $steps = 0;
while($pos < $length && $pos >= 0) {
    my $mv = $lines[$pos];
    $lines[$pos]++;
    $pos += $mv;
    $steps++;
}
print $steps,"\n";
