#! /usr/bin/perl
use strict;
use warnings;

my @lines = <>;
foreach (@lines) { chomp; }
my @tops;
foreach my $line (@lines) {
    next if $line !~ m/->/;
    my @sides = split('-> ', $line);
    push @tops, split(', ', $sides[1]);
}
my @all = map { my @s = split(' '); $s[0] } @lines;

my %h;
foreach my $t (@tops) {
    $h{$t} = 1;
}
foreach my $a (@all) {
    print "$a\n" unless $h{$a};
}

