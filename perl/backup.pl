#!/usr/bin/perl
use strict;
use warnings;
use feature 'say';
use Getopt::Long qw(GetOptions);

my $home = "/home/peachie";

my @repos = (
             ".dotfiles/",
             "Documents/",
             "Scripts/",
             "Server/",
             "Shared/",
            );

my @localdirs = (

                );

my @alldirs = (@repos, @localdirs);

my $git;
my $usb;
my $help;

GetOptions (
            "git|g" => \$git,
            "usb|u" => \$usb,
            "help|h" => \$help,
            ) or die "Usage: backup [--git|g] [--usb|u] [--help|-h]\n";

if ($help) {
  say "Usage: backup [--git|g] [--usb|u] [--help|-h]";
  exit 0;
} elsif (!defined $git && !defined $usb) {
  say "Please specify sync location(s)";
  say "Usage: backup [--git|g] [--usb|u] [--help|-h]";
};

if ($git) {
  foreach my $repo (@repos) {
    say "☆⸜(｡˃ ᵕ ˂ )⸝☆ Changing working directory to $repo";
    chdir("$home/$repo") or die "Cannot change directory: $!\n";
    say "☆⸜(｡˃ ᵕ ˂ )⸝☆ Pushing latest changes to Github";
    system("git add .");
    system("git commit -m 'Sync'");
    system("git push");
  }
}

if ($usb) {
  foreach my $dir (@alldirs) {

  }
}
