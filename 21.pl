#!/usr/bin/perl
use strict;
use warnings;
use List::Util qw(sum);

my $number = shift;	# 10000 for project euler
my %sumDivs;
my $sum = 0;

for my $i (2..$number) {
	$sumDivs{$i} = getSumDivs($i);
}

for my $i (2..$number) {
	for my $j (2..$number) {
		if ($i != $j) {
			if ($sumDivs{$i} == $j && $sumDivs{$j} == $i) {
				$sum += $i; # no need to add $j since we do an n-by-n parsing (each value is parsed twice) 
			}
		}
	}
}

print $sum;


sub getSumDivs {
	my $number = shift;
	my @divs = grep { $number % $_ == 0 } 1 .. sqrt($number);
	push @divs, , map {$number == $_*$_ ? () : $number/$_} reverse @divs;
	pop(@divs);	# they do not count self as a divisor
	return sum(@divs);
}
