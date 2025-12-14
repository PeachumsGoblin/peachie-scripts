#!/usr/bin/perl
use strict;
use warnings;
use feature 'say';

=head1 Instructions

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
