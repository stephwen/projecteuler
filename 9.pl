#!/usr/bin/perl
use strict;
use warnings;

my $number = shift;	# 1000 for project euler

for my $i (1..($number/2)) {
	for my $j (1..($number/2)) {
		my $rest = $number - ($i+$j);
		if (isTriplet($i, $j, $rest)) { print $i*$j*$rest; exit; }	
	}
}

sub isTriplet {
	my $first = shift;
	my $second = shift;
	my $third = shift;
	return ($third*$third == ($first*$first + $second*$second));	
}
