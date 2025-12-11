#!/usr/bin/perl
use strict;
use warnings;
use feature 'say';

=head1 Instructions

Write a program that reads a list of numbers (on separate lines) until end-of-
input and then prints for each number the corresponding person’s name from the
following list. (Hardcode this list of names into your program. That is, it should
appear in your program’s source code.) For example, if the input numbers were 1,
2, 4, and 2, the output names would be fred, betty, dino, and betty

=cut
my @strings;

print "Enter strings to sort. Hit CTRL+D when finished.\n";
chomp(@strings = <STDIN>);
my @sorted = sort(@strings);
print "Printing sorted strings...\n";

print "@sorted\n";

foreach my $string (@sorted) {
  print "$string\n";
}
