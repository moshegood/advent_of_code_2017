#! /usr/bin/perl
use strict;
use warnings;

my @lines = <>;
foreach (@lines) { chomp; }
my @tops;
my %children;
my %weights;
my %parents;
my $ccc = 0;
foreach my $line (@lines) {
    my @parts = split(' ', $line);
    my $name = shift @parts;
    my $wt = shift @parts;
    $wt = substr($wt, 1, -1);
    my $arrow = shift @parts;
    foreach my $c (@parts) {
        if( substr($c,-1) eq "," ) {
            substr($c,-1,1,'');
        }
        $parents{$c} = $name;
        $ccc++;
    }
    $children{$name} = \@parts;
    $weights{$name} = $wt;
}
my %total = %weights;
while(1) {
    my %old = %total;
    my $changed = 0;
    foreach my $k (keys %total) {
        my $sum = $weights{$k};
        foreach my $c (@{$children{$k}}){
            $sum += $total{$c};
        }
        $total{$k} = $sum;
        $changed = 1 if $sum != $old{$k};
    }
    last if !$changed;
}
my $root;
foreach my $x (keys %children) {
    next if $parents{$x};
    $root = $x;
}

my $m;
while(1) {
    my %h;
    print "Looking at $root\n";
    foreach my $x (@{$children{$root}}) {
        $h{$total{$x}}++;
    }
    my @s = sort { $h{$b} <=> $h{$a} } keys %h;
    foreach my $x (@s) {
        print "$x seen $h{$x} times\n";
    }
    if (scalar @s == 1){
        print "SOLUTION: $root needs to total $m\n";
        print "  so its weight must be ", $m - $s[0] * $h{$s[0]}, "\n";
        last;
    }
    $m = $s[0];

    my $nr;
    foreach my $x (@{$children{$root}}) {
        my $off = $total{$x} - $m;
        if ($off) {
            print "Assume $x is off by $off\n";
            $nr = $x;
        }
    }
    if ($nr ne $root) {
        $root = $nr;
        print "Total for $root should be $m\n";
    }
    else {
        last;
    }
}
print $m, "\n";

