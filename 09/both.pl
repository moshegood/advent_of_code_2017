use strict;
use warnings;

while(my $input = <>) {
    print $input;
    chomp $input;

    my @cs = split('', $input);

    my $nest_lvl = 0;
    my $garbage = 0;
    my $sum = 0;
    my $sum_g = 0;
    while (my $c = shift @cs) {
        if( $c eq '>') {
            $garbage = 0;
        }
        elsif ( $garbage ) {
            if ( $c eq '!' ) {
                shift @cs;
            }
            else {
                $sum_g++;
            }
            next;
        }
        elsif( $c eq '<') {
            $garbage = 1;
        }
        elsif ( $c eq '{' ) {
            $nest_lvl++;
        }
        elsif ( $c eq '}' ) {
            $sum += $nest_lvl;
            $nest_lvl--;
        }
    }
    print "Nested group total: $sum\n";
    print "Garbase total: $sum_g\n";
}
