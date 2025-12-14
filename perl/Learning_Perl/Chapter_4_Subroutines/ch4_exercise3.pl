#!/usr/bin/perl
use v5.42;
use strict;
use warnings;

sub total {
  my $sum = 0;
  foreach (@_) {
    $sum += $_; # Control variable
  }
  $sum;
}

sub average {
  if (@_ == 0) { return }
  my $count = @_;
  my $sum = total(@_);
  $sum/$count;
}

sub above_average {
  my $average = average(@_);
  my @list;
  foreach my $element (@_) {
    if ($element > $average) {
      push @list, $element;
    }
  }
  @list;
}


# sub average {
#  my $sum = 0;
#  my $dividend = 0;
#  foreach (@_) {
#    $dividend += 1;
#    $sum = &total;
#  }
#  $sum / $dividend;
#}

#sub above_average {
#  &average;
#  my @above_average_numbers;
#  my $average = &average;
#  foreach my $number (@_) {
#    if ($number gt $average) {
#      push (@above_average_numbers, $number);
#   }
#  }
#  @above_average_numbers;
#}
my @fred = above_average(1..10);
print "\@fred is @fred\n";
print "(Should be 6 7 8 9 10)\n";
my @barney = above_average(100, 1..10);
print "\@barney is @barney\n";
print "(Should be just 100)\n";
