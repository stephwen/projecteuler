#!/usr/bin/perl
use strict;
use warnings;

my $limit = shift;	# 1000 for project euler
my $maxNum = 0;
my $maxA;
my $maxB;

my $a = -$limit;
my $b = -$limit;
my $n = 1;

while ($a <= $limit) {
	my $formula = $n*$n + $a*$n + $b;
	if (isPrime($formula)) {
		if ($n > $maxNum) { $maxNum = $n; $maxA = $a; $maxB = $b; }
		$n++;
	} else {
		$n = 1; $b++;
	}
	if ($b > $limit) { $b = 1; $a++; $n = 1; }
} 

print $maxA*$maxB."\n";

sub isPrime {
        my $number = shift;
	if ($number < 0) { return 0; }
        for my $i (2..int(sqrt($number))) {
                if ($number % $i == 0) { return 0; }
        }
        return 1;
}
