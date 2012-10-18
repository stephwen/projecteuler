#!/usr/bin/perl
use strict;
use warnings;
use Math::BigInt;

my $nbDigits = shift;	# 1000 for project euler

my $fib_1 = Math::BigInt->new("1");
my $fib_2 = Math::BigInt->new("1");
my $temp_ = Math::BigInt->new("0");
my $idx_ = 2;

while ($fib_1->length() < $nbDigits && $fib_2->length() < $nbDigits) {
        $temp_->bzero()->badd($fib_1)->badd($fib_2);
        $fib_2->badd($temp_);
        $fib_1 = $temp_->copy();
	$idx_ += 2;
}

if ($fib_1->length() == $nbDigits) { print ($idx_-1); } else { print $idx_; }

print "\n";
