#!/usr/bin/perl
use strict;
use warnings;
no warnings 'recursion';

my $number = shift;

my %chains;	# key: start, value: length
my %longest = (
	"index"	 => 0,
	"length" => 0
);

$chains{1} = 1;

for my $i (1..$number) {
	my $val = compute($i);
	if ($val > $longest{'length'}) {
		$longest{'index'} = $i;
		$longest{'length'} = $val;
	}
}

# there is some 'deep' recursion here
sub compute {
	my $number = shift;
	if ($chains{$number}) { return $chains{$number}; } else {
		if ($number % 2 == 0) {
			$chains{$number} = 1 + compute($number/2);
		} else {
			$chains{$number} = 1 + compute($number*3+1);
		}
	}
}

print "Longest chain starts at index ".$longest{'index'}." and is ".$longest{'length'}." long\n";
