#!/usr/bin/perl
use strict;
use warnings;

my $number = shift;

my $sumOfSquare = 0;
my $squareOfSum = 0;

for my $i (1..$number) {
	$sumOfSquare += $i*$i;
	$squareOfSum += $i;
}

$squareOfSum *= $squareOfSum;

print $squareOfSum - $sumOfSquare;
