#!/usr/bin/perl
use v5.42;
use strict;
use warnings;

print "Enter column width: ";
chomp(my $width = <STDIN>);

print "Enter some lines, then end with CTRL+D:\n";
chomp(my @lines = <STDIN>);

print "1234567890" x (($width+9)/10), "\n";

foreach (@lines) {
  printf "%${width}s\n", $_;
}
