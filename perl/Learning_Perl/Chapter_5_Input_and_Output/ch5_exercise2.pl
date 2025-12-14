#!/usr/bin/perl
use v5.42;
use strict;
use warnings;


my @inputs;

while (<STDIN>) {
  chomp($_);
  push @inputs, $_;
}

print "123456789012345678901234567890123456789012345678901234567890\n";

foreach my $input (@inputs) {
  printf "%20s\n", "$input";
}
