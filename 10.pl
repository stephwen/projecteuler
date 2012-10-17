#!/usr/bin/perl
use strict;
use warnings;

my $number = shift;	# 2000000 for project euler
my $sum = 0;

for my $i (2..$number-1) {
	if (isPrime($i)) { $sum += $i; }
}

print $sum;

sub isPrime {
        my $number = shift;
        for my $i (2..int(sqrt($number))) {
                if ($number % $i == 0) { return 0; }
        }
        return 1;
}

