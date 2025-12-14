#!/usr/bin/perl
use v5.42;
use strict;
use warnings;
use Text::Wrap;

$Text::Wrap::columns = 70;
my $key;
my $col1_width = 30;
my $initial_indent = " " x $col1_width;
my $subsequent_indent = $initial_indent;

printf("%-30s %-30s\n", "VARIABLE", "VALUE");
printf("%-30s %-30s\n", "----------", "--------------------");

foreach my $key (sort keys %ENV) {
  my $value = $ENV{$key};
  my $formatted_value = wrap("", $subsequent_indent, "$value");
  printf ("%-${col1_width}s | %s\n", $key, $formatted_value);
}
