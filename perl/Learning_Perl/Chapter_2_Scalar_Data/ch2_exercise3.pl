#!/usr/bin/perl
use strict;
use warnings;
use feature 'say';

my $pi = 3.141592654;
my $radius;

print "Enter radius of the given circle:\n";
$radius = <STDIN>;
my $circumference = (2 * $pi * $radius);

if ($circumference lt 0) {
  print "0\n";
} else {
  print "$circumference\n";
}
