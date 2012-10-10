#!/usr/bin/perl
use strict;
use warnings;

my $fib1 = 1;
my $fib2 = 2;
my $sum = 2;

my $limit = shift;

while ($fib1 <= $limit && $fib2 <= $limit) {
	$fib1 += $fib2;
	if ($fib1 % 2 == 0 && $fib1 <= $limit) { $sum += $fib1; }
        $fib2 += $fib1;
        if ($fib2 % 2 == 0 && $fib2 <= $limit) { $sum += $fib2; }
}
print $sum;
