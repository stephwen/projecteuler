#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
my $number = shift;

my %words;

# words for 1 to 20 are unique
# same for multiples of ten

$words{1} = "one";
$words{2} = "two";
$words{3} = "three";
$words{4} = "four";
$words{5} = "five";
$words{6} = "six";
$words{7} = "seven";
$words{8} = "eight";
$words{9} = "nine";
$words{10} = "ten";
$words{11} = "eleven";
$words{12} = "twelve";
$words{13} = "thirteen";
$words{14} = "fourteen";
$words{15} = "fifteen";
$words{16} = "sixteen";
$words{17} = "seventeen";
$words{18} = "eighteen";
$words{19} = "nineteen";
$words{20} = "twenty";
$words{30} = "thirty";
$words{40} = "fourty";
$words{50} = "fifty";
$words{60} = "sixty";
$words{70} = "seventy";
$words{80} = "eighty";
$words{90} = "ninety";

# words for 21 to 99 are based on preivously defined unique words

for my $i (2..9) {
        my $tenths = 10*$i;     # 20, 30, .., 90
        for my $j (1..9) {
                my $value = $tenths + $j;
                $words{$value} = $words{$tenths}."-".$words{$j};
        }
}

# now just add everything hundred related

for my $k (1..9) {
	$words{$k*100} = $words{$k}." hundred";
	for my $i (1..99) {
		my $value = $k*100 + $i;
	        $words{$value} = $words{$k*100}." and ".$words{$i};
	}
}


$words{1000} = "one thousand";

my $nbLetters = 0;

for my $i (1..$number) {
	$nbLetters += length($words{$i});
}

print $nbLetters;
