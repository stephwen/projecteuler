#!/usr/bin/perl
use strict;
use warnings;
use Math::BigInt;

my $number = shift;	# 100 for project euler
my $base = Math::BigInt->new($number);
my $fac = $base->bfac();
my @digits = split(//, $fac);
my $sum = 0;
foreach my $digit (@digits) { $sum += $digit; }
print $sum;

