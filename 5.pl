#!/usr/bin/perl
use strict;
use warnings;

my $number = shift;	# 20 for project euler

my $j = $number;
my $i = 2;

while ($i <= $number) { 
	if ($j % $i == 0) {
		$i++;
	} else {
		$j++; $i = 2;
	}
}

print $j;
