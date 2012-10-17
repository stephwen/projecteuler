#!/usr/bin/perl
use strict;
use warnings;

my $limit = shift;	# 1000 for project euler
my $sum = 0;
for my $i (1..($limit-1)) {
	if ($i % 3 == 0 || $i % 5 == 0) {
		$sum += $i;
	}
}

print $sum;

