#!/usr/bin/perl
use strict;
use warnings;

my $number = shift;
my $i = 1;	# n-th prime number
my $j = 2;	# prime number

while ($i < $number) {
	$j++;
	if (isPrime($j)) { $i++; }
}

print $j." is the ".$i."th prime number\n";

sub isPrime {
        my $number = shift;
        for my $i (2..int(sqrt($number))) {
                if ($number % $i == 0) { return 0; }
        }
        return 1;
}

