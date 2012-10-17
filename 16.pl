#!/usr/bin/perl
use strict;
use warnings;
use Math::BigInt;

my $number = shift;	# 1000 for project euler
my $exponent = Math::BigInt->new($number);
my $two = Math::BigInt->new(2);
my $value = $two->bpow($exponent);
my @digits = split(//, $value);
my $sum = 0;
foreach my $digit (@digits) { $sum += $digit; }
print $sum;


