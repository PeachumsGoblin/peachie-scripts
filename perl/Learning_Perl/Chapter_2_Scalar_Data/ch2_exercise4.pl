#!/usr/bin/perl
use strict;
use warnings;
use feature 'say';


print "Enter multiplicand: \n";
my $x = <STDIN>;
print "Enter multiplier: \n";
my $y = <STDIN>;
my $product = ($x * $y);
print "Product: $product\n";
