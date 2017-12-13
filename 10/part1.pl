use strict;
use warnings;

my @a;
foreach my $i (0 .. 255) {
    $a[$i] = $i;
}

my $input = <>;
chomp $input;
my @is = split(',', $input);
my $pos = 0;
my $skip = 0;
foreach my $i (@is) {
    my @b = @a;
    foreach my $x (0 .. $i -1) {
        $a[($pos + $x) % 256 ] = $b[($pos + $i - $x) % 256];
    }
    $pos += $i + $skip;
    $skip++;
    print join(",", @a, "\n");
}
print $a[0]*$a[1],"\n";
