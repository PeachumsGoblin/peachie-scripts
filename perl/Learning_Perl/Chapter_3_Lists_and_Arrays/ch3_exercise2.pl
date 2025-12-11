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
my @names = qw( fred betty barney dino wilma pebbles bamm-bamm ); # 7 names max
my @numbers;

print "Enter numbers between 0 and 7 to see their associated name. Hit CTRL+D when finished.\n";
chomp(@numbers = <STDIN>);

print "Printing names...\n";

foreach my $number (@numbers) {
  if ($number lt 7 && $number ge 0) {
    print "Number: $number -- Name: $names[$number]\n";
  } else {
    print "Number: $number -- Name: No valid entry found.\n"
  }
}
