use strict;
use warnings;

my @lines = <>;
my %h;
my $max = -1e9;
foreach my $line (@lines) {
    chomp $line;
    print "$line\n";
    $line =~ m/^(.*) (.*) (.*) if (.*) (.*) (.*)$/;
    my ($v, $o, $d, $v2, $o2, $d2) = ($1, $2, $3, $4, $5, $6);
    my $op = $o eq "inc" ? "+=" : "-=";
    my $s = "\$h{$v} $op $d if \$h{$v2} $o2 $d2";
    print "$s\n";
    eval "$s";
    foreach my $v (values %h) {
        $max = $v if $v > $max;
    }
}
use Data::Dumper;
print Dumper(\%h);

print join(' ', sort({ $a <=> $b } values %h)), "\n";
print "Max ever: $max\n";

