#!/usr/bin/perl
use strict;
use warnings;
use v5.10;
use Math::BigInt;	# otherwise, it bugs for very large numbers

my %numbers;

my $limA = 100;
my $limB = 100;

for my $a (2..$limA) {
	for my $b (2..$limB) {
		$a = Math::BigInt->new($a);
		$b = Math::BigInt->new($b);
		my $number = $a->copy()->bpow($b);
		$numbers{$number} = 1;
	}
}

#say join(", ", (sort {$a <=> $b} keys %numbers));
my $count = keys %numbers;
say $count;
