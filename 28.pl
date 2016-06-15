#!/usr/bin/perl
use strict;
use warnings;
use v5.10;

my $maxSquareSize = 1001;
my $sum = 1;
my $numberToSum = 1;

for (my $squareSize = 3; $squareSize <= $maxSquareSize; $squareSize += 2) {
	my $diff = $squareSize - 1;

	for my $i (1..4) {
		$numberToSum += $diff;
		$sum += $numberToSum;
	}
}

say $sum;
