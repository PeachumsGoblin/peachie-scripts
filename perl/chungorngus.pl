#!/usr/bin/perl
use strict;
use warnings;
use feature 'say';
use Term::ANSIColor;
use Getopt::Long qw(GetOptions);
Getopt::Long::Configure qw(gnu_getopt);

my $test_number = 0;



my $maggie = "Uni Propus";
my $maisie = "Sunstar Ninipie";
my @cats = ($maggie, $maisie);
my $cat;



sub yes_or_no {
    my ($query) = @_;
    my $answer;

    while (1) {
      print "$query (Y/N): ";
      $answer = <STDIN>;
      chomp($answer);

      if ($answer =~ /^[Yy](es)?$/) {
        return 1; # True (yes)
      } elsif ($answer =~ /^[Nn](o)?$/) {
        return 0; # False (no)
      } else {
        print "Give a valid answer you fool.\n"
      }
    }
  }

foreach my $cat (@cats) {
  my $stink_answer = yes_or_no("Is $cat poopy-stinky?");
  if ($stink_answer) {
    print color('bold red'), "I hate $cat!!! 😡\n", color('reset');
  } else {
    print color('blue'), "I love $cat 😇\n", color('reset');
  }
}
