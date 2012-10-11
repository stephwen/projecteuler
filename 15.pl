#!/usr/bin/perl
use strict;
use warnings;

# 1-by-1 grid => 2 routes (down then right, and right, then down)
# 2-by-2 grid => 6 routes (all combinations of 2 downs and 2 rights)
# n-by-n grid => all combinations of n downs and n rights => n*(n-1)

my $number = shift;

print $number*($number-1);
