#!/usr/bin/perl
use strict;
use warnings;
use feature 'say';

=head1 Instructions

Write a program that reads a list of strings on separate lines until end-of-
input and prints out the list in reverse order. If the input comes from the key‐
board, you’ll probably need to signal the end of the input by pressing Ctrl-D in
Unix

=cut
my @lines;
print "Array Reverser\n";
print "Enter as many lines as desired to add to the array. Press ENTER to start a new entry. Press CTRL+D to end input.\n";
chomp(@lines = <STDIN>);
my @reversed = reverse(@lines);
print "Printing reversed array...\n";
foreach my $line (@reversed) {
  print "$line\n"
}
