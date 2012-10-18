#!/usr/bin/perl
use strict;
use warnings;
use bignum ( p => -9999 );	# this is huge, by the way

my $limit = shift;	# 1000 for project euler
my $longest = 1;
my $value;

for my $val (1..$limit) {
	my $frac = 1/$val;
	if (reverse($frac) =~ /(\d+)\1+/) {
		my $longestSubChain = reverse($1); 
		if ($longestSubChain =~ /(\d+?)\1+/) {
			if (length($1) > $longest) { $longest = length($1); $value = $val; }
		}
	}
}

print "d = $value\n";
print "Longest recurring cycle: $longest";

# \d means digit
# \d+ means 1 or more digits
# (\d+?) means 1 or more digits, but the ? means smallest possible string (non-greedy)
# (\d+?)\1+ is a back-reference, it means 1 or more times of what is matched by (\d+?)

# if we only use one regex ( (\d+?)\1+ ) and if we come across such a number : 0.00123412341234
# we will get "00". So we have to take the longest sub-chain ( 123412341234 ) and then look
# for the smallest repeated chain in this sub-chain
