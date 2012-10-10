#!/usr/bin/perl
use strict;
use warnings;

my $number = shift;
my $triangle = 1;
my $i = 1;
my $n = 0;
my $divs;

until ($n > $number) {
	$i++;
	$triangle += $i;
	$divs = getDivisors($triangle);
	$n = @$divs;
}

print "$i\t$triangle: ".join(", ", @$divs)."\n";

sub getDivisors {
	my $number = shift;
	my @divisors = ();
	for my $i (1..sqrt($number)) {
		if ($number % $i == 0) { push(@divisors, $i); }
	}
	my @tempDiv = @divisors;
	for my $div (@tempDiv) {
		if ($div != $number / $div) {
			push(@divisors, $number / $div);
		}
	}
	return \@divisors;
}

