#! /usr/bin/perl
use strict;
use warnings;

while( <STDIN> ) {
  chomp;
  if ( /$ARGV[0]/ ) {
    print "\tMatches\n";
  }
  else {
    print "\tDoesn't match\n";
  }
}
