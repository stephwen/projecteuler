#!/usr/bin/perl
use strict;
use warnings;

my $number = shift;
my $largestPrime = 0;

for my $i (2..int(sqrt($number))) {
	if (isPrime($i) && $number % $i == 0) {
		$largestPrime = $i;
	}
}

sub isPrime {
	my $number = shift;
	for my $i (2..int(sqrt($number))) {
		if ($number % $i == 0) { return 0; }
	}
	return 1;
}

print $largestPrime;

