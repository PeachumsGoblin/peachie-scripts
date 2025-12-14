#!/usr/bin/perl
use v5.42;
use strict;
use warnings;

sub total {
  my $sum = 0;
  foreach (@_) {
    $sum += $_; # Control variable
  }
  $sum;
}

my @fred = { 1 .. 1000 };
my $fred_total = &total(@fred);
print "The total of \@fred is $fred_total.\n";
