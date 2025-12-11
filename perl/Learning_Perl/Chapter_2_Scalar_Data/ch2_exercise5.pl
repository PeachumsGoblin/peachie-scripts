#!/usr/bin/perl
use strict;
use warnings;
use feature 'say';


print "Enter string: \n";
chomp(my $string = <STDIN>);
print "Enter multiplier: \n";
chomp(my $multiplier = <STDIN>);
print "$string\n" x $multiplier;
