#!/usr/bin/perl
use v5.42;
use strict;
use warnings;

my %names = (
               fred => "flintstone",
               dino => undef,
               barney => 'rubble',
               betty => 'rubble',
               wilma => 'flintstone',
              );

sub get_name {
  print "Please enter a first name to search.\n";
  chomp(my $first_name = <STDIN>);
  my $last_name = $names{$first_name} //= '(No Last Name Found)';
  print "Name: $first_name $last_name\n";
}


&get_name;
