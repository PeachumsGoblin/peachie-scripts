#!/usr/bin/perl
use v5.42;
use strict;
use warnings;

=head1 Instructions

4. [10] Write a subroutine named greet that welcomes the person you name by tell
ing them the name of the last person it greeted:
greet( "Fred" );
greet( "Barney" );
This sequence of statements should print:
Hi Fred! You are the first one here!
Hi Barney! Fred is also here!

=cut
# my $name;

# test_greet( "test" );

greet( "Fred" );
greet( "Barney" );

sub greet {
  state $last_person;
  my $name = shift;
  print "Hi $name! ";

  if( defined $last_person ) {
    print "$last_person is also here!\n";
  } else {
    print "You are the first one here!\n";
  }
  $last_person = $name;
}
