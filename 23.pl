#!/usr/bin/perl
use strict;
use warnings;
use List::Util qw(sum);

my $upperLimit = 28123;
my %abundants;
my %abunSums;

for my $i (2..$upperLimit) {
	if (isAbundant($i)) { 
		for my $ab2 (keys %abundants) {
			$abunSums{($i+$ab2)} = 1;
		}
		$abundants{$i} = 1;
	}
}

my $sum = 0;
for my $num (2..$upperLimit) {
	if (!$abunSums{$num}) { $sum += $num; }
}
print $sum;

sub isAbundant {
        my $number = shift;
        return $number < getSumDivs($number);
}

sub getSumDivs {
        my $number = shift;
        my @divs = grep { $number % $_ == 0 } 1 .. sqrt($number);
        push @divs, , map {$number == $_*$_ ? () : $number/$_} reverse @divs;
        pop(@divs);     # they do not count self as a divisor
        return sum(@divs);
}

