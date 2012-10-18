#!/usr/bin/perl
use strict;
use warnings;
use List::Util qw(sum);
use Data::Dumper;

my $upperLimit = 28123;
my %abundants;
my %abunSums;

for my $i (1..$upperLimit) {
	if (isAbundant($i)) {
		$abundants{$i} = 1;
	}
}

for my $ab1 (keys %abundants) {
	for my $ab2 (grep { $_ + $ab1 <= $upperLimit } keys %abundants) {
		$abunSums{($ab1+$ab2)} = 1;
	}
}

my $sum = 0;
for my $num (1..($upperLimit)) {
	if (!$abunSums{$num}) { $sum += $num; }
}
print $sum;

sub isAbundant {
        my $number = shift;
        return $number < getSumDivs($number);
}

sub getSumDivs {
        my $number = shift;
	return 1 if $number == 1;
        my @divs = grep { $number % $_ == 0 } 1 .. sqrt($number);
        push @divs, , map {$number == $_*$_ ? () : $number/$_} reverse @divs;
        pop(@divs); # they do not count self as a divisor
        return sum(@divs);
}
