#! /usr/bin/perl
use strict;
use warnings;

while(my $line = <>) {
    chomp $line;
    my @ns = split(' ', $line);
    my $length = scalar @ns;

    my $steps = 0;
    my %seen;
    while(!$seen{"@ns"}) {
        $seen{"@ns"} = 1;

        my $max = 0;
        my $idx = 0;
        while( $idx < $length ) {
            $max = $idx if $ns[$idx] > $ns[$max];
            $idx++;
        }

        my $x = $ns[$max];
        $ns[$max] = 0;
        foreach my $i (1 .. $x){
            $ns[($max + $i) % $length]++;
        }

        $steps++;
    }
    print $steps,"\n";
}
