#!/usr/bin/perl
use strict;
use warnings;
use feature 'say';
use Getopt::Long qw(GetOptions);

my @repos = (
             '/home/peachie/.dotfiles/',
             '/home/peachie/Documents/',
             '/home/peachie/Scripts/',
             '/home/peachie/Server/',
             '/home/peachie/Shared/',
            );

foreach my $repo (@repos) {
  say "Changing working directory to $repo";
  chdir($repo) or die "Cannot change directory: $!\n";
  say "Pushing latest changes to Github";
  system("git add .");
  system("git commit -m 'Sync'");
  system("git push");
}
