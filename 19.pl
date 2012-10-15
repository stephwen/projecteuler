#!/usr/bin/perl
use strict;
use warnings;

my $month = 1;
my $year = 1900;
my $day = 1;
my $weekDay = 1;

my $nbSundays = 0;

while ($year <= 2000) {
	my $nbDaysInMonth = getNbDaysInMonth($year, $month, $day);

	if ($day <= $nbDaysInMonth) {
		print "$year/$month/$day: $weekDay\n";
		$weekDay++;
		if ($weekDay > 7) {$weekDay = $weekDay % 7; }
		$day++;
	} elsif ($month < 12) {
		$month++; $day = 1;
	} else {
		$month = 1; $day = 1; $year++;
	}
}

print $nbSundays;

sub isLeapYear {
	if ($year % 400 == 0) { return 1; }
	elsif ($year % 100 == 0) { return 0; }
	elsif ($year % 4 == 0) { return 1; }
	else { return 0; }
}

sub getNbDaysInMonth {
	my $year = shift;
	my $month = shift;
	my $day = shift;
	my $nbDaysInMonth;

        if ($month == 1 || $month == 3 || $month == 5 || $month == 7 || $month == 8 || $month == 10 || $month == 12) {
                $nbDaysInMonth = 31; }
        elsif ($month == 4 || $month == 6 || $month == 9 || $month == 11) { $nbDaysInMonth = 30; }
        else {
                if (isLeapYear($year)) { $nbDaysInMonth = 29; }
                else { $nbDaysInMonth = 28; }
        }
	return $nbDaysInMonth;
}

