#!/usr/bin/perl
use strict;
use warnings;
use List::Util qw(max);

my $largest = 0;
my $nbDigits = shift;

my $max = (10**$nbDigits) - 1;
my $min = 10**($nbDigits - 1);

for my $a ($min..$max) {
	for my $b ($min..$max) {
		if (isPalindrome($a*$b)) {
			$largest = max($a*$b, $largest);
		}
	}
}

print $largest;

sub isPalindrome {
	my $number = shift;
	my @digits = split(//, $number);
	my $nbDigits = @digits;
	for my $i (0..int($nbDigits/2)) {
		if ($digits[$i] != $digits[$nbDigits-$i-1]) {
			return 0;
		}
	}
	return 1;
}
