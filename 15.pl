#!/usr/bin/perl
use strict;
use warnings;

# 1-by-1 grid => 2 routes (down then right, and right, then down)
# 2-by-2 grid => 6 routes (all combinations of 2 downs and 2 rights)
# n-by-n grid => all combinations of n downs and n rights => 2n!/((n!)(2n-n)!)) = 2n!/(n!)^2

my $number = shift;	# 20 for project euler

print factorial(2*$number)/(factorial($number)**2);

sub factorial {
        my $nb = shift;
        if ($nb == 0) { return 1; }
        else { return $nb * factorial($nb - 1); }
}
