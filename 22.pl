#!/usr/bin/perl
use strict;
use warnings;

my $globalScore = 0;

open(IN, "<", 'names.txt');
my @names = sort map { (my $name = $_) =~ s/\W//g; $name } split(/,/, <IN>);
close(IN);

my $ind = 1; my %corr; for my $letter ('A'..'Z') { $corr{$letter} = $ind++; }

for my $i (0..$#names) {
	my $score = 0;
	my $pos = $i + 1;
	for my $letter (split//, $names[$i]) {
		$score += $corr{$letter};
	}
	$score *= $pos;
	$globalScore += $score;
}

print $globalScore;
