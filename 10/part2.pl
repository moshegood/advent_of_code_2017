use strict;
use warnings;

my @a;
foreach my $i (0 .. 255) {
    $a[$i] = $i;
}

my $input = <>;
chomp $input;
my @is = map { ord } split('', $input);
push @is, 17, 31, 73, 47, 23;
print "@is\n";
my $pos = 0;
my $skip = 0;
foreach my $r (1 .. 64) {
    foreach my $i (@is) {
        my @b = @a;
        foreach my $x (0 .. $i -1) {
            $a[($pos + $x) % 256 ] = $b[($pos + $i - $x -1) % 256];
        }
        $pos += $i + $skip;
        $pos = $pos % 256;
        $skip++;
    }
    print "End of round $r. Pos: $pos, Skip: $skip\n";
    if($r == 1) {
        print "@a\n";
    }
}
print "@a\n";
my $xor = 0;
my @dh;
foreach my $i (0 .. 255){
    if ($i % 16 == 0) {
        $xor = 0;
    }
    $xor = $xor ^ $a[$i];
    if ($i % 16 == 15) {
        push @dh, $xor;
    }
}
print "@dh\n";
my @hex = map { sprintf("%02x", $_) } @dh;
print @hex,"\n";

