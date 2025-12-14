#!/usr/bin/perl
use v5.42;
use strict;
use warnings;

my %count;
print "Enter words.\n";
chomp(my @words = <STDIN>);

foreach my $word (@words) {
  $count{$word} += 1;
}

foreach my $word (sort keys %count) {
  print "$word was seen $count{$word} times.\n"
}
