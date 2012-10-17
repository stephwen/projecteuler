#!/usr/bin/perl
use strict;
use warnings;

my @digits = (0 .. 9);
print findNthPermutation(1000000, \@digits);

# we know there are n! permutations of sets of n digits
# perms starting with first digit are at index 1 to n!/n
# perms starting with m-th digit are at index 1+m*n!/n to (m+1)*n
# Knowing that we look for a specific index (1 million), we can find
# the first character. Then recursively, we find the first character
# of each permutation of digits from the remaining subset.
sub findNthPermutation {
	my $index = shift;
	my $arrayRef = shift;
	my @digits = sort(@$arrayRef);
	my $nbDigits = $#digits + 1;
	my $nbPermuts = factorial($nbDigits);

	if ($nbDigits == 1) {
		return $digits[0];
	} else {
		my $step = $nbPermuts / $nbDigits;
		my %start;
		my %stop;
		for my $i (0..$#digits) {
			$start{$i} = 1 + $i*$step;
			$stop{$i} = ($i+1)*$step;

			if ($index >= $start{$i} && $index <= $stop{$i}) {
				my $firstChar = $digits[$i];
				my @subArray = grep { $_ != $firstChar } @digits;
		                return $firstChar.findNthPermutation(($index-$start{$i}+1),\@subArray);
			}
		}
	}
}

sub factorial {
	my $nb = shift;
	if ($nb == 0) { return 1; }
	else { return $nb * factorial($nb - 1); }
}
