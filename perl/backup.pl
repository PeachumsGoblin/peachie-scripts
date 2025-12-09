#!/usr/bin/perl
use strict;
use warnings;
use feature 'say';
use Getopt::Long qw(GetOptions);

my $home = "/home/peachie";

my @homerepos = (
             ".dotfiles/",
             "Documents/",
             "Scripts/",
             "Server/",
             "Shared/",
            );

my @localdirs = (

                );

my $git;
my $usb;
my $help;

GetOptions (
            "usb|u" => \$usb,
            "git|g" => \$git,
            "help|h" => \$help,
            ) or die "Usage: backup [--usb|u] [--git|g] [--help|-h]\n";

if ($help) {
  say "Usage: backup [--usb|u] [--git|g] [--help|-h]";
  exit 0;
} elsif (!defined $git && !defined $usb) {
  say "Please specify sync location(s)";
  say "Usage: backup [--usb|u] [--git|g] [--help|-h]";
};

my $uuid = "UUID=8a135c35-a49c-4c50-9895-6942d1e09753";
my $mountcheck = "findmnt --source $uuid";

if ($usb) {
  say "Checking if USB is mounted...";
  my $mountcheck_output = `$mountcheck`;
  my $mountcheck_exitcode = $?;
  if ($mountcheck_exitcode == 0) {
    print "USB thumbdrive is mounted.\n";
  } else {
    print "USB thumbdrive is not mounted.\n";
    say "Attempting to mount USB thumbdrive...";
    system("sudo mount $uuid /mnt/thumb");
    my $mountcheck_output = `$mountcheck`;
    my $mountcheck_exitcode = $?;
    if ($mountcheck_exitcode == 0) {
      print "USB thumbdrive is mounted.\n";
    } else {
      print "Mounting USB thumbdrive failed.\n";
      exit 1;
    };
  };
  say "ヽ(*・ω・)ﾉ Commencing USB backup~!";
  foreach my $dir (@homerepos) {
    say "(づ*ᴗ͈ˬᴗ͈)づ*.ﾟ✿ Syncing $dir to USB";
    system("sudo rsync -avz $home/$dir /mnt/thumb/home-backup/$dir");
  };
  foreach my $dir (@localdirs) {
    say "(づ*ᴗ͈ˬᴗ͈)づ*.ﾟ✿ Syncing $dir to USB";
    system("echo sudo rsync -avz $dir /mnt/thumb/other-backup/$dir");
  };
}

if ($git) {
  say "ヽ(*・ω・)ﾉ Commencing Github backup~!";
  foreach my $dir (@homerepos) {
    say "(づ*ᴗ͈ˬᴗ͈)づ*.ﾟ✿ Changing working directory to $dir";
    chdir("$home/$dir") or die "Cannot change directory: $!\n";
    say "(づ*ᴗ͈ˬᴗ͈)づ*.ﾟ✿ Pushing latest changes to Github";
    system("git add .");
    system("git commit -m 'Backup from Perl script'");
    system("git push");
  }
}
