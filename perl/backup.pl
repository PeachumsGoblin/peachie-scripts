#!/usr/bin/perl
use strict;
use warnings;
use feature 'say';
use Getopt::Long qw(GetOptions);

=head1 Notes

- To Github
  - Check git status
    - Print all git statuses, then if any return dirty, die
  - Add, commit and push
- To USB
  - Check if USB is mounted (or die)
  - Check if folders exist
    - If not, make folders
  - Copy folders over
- To Server
  - Check if NFS is mounted (or die)
  - Check if folders exist
    - If not, make folders
  - Copy folders over

=cut


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
my $qnap;
my $help;

GetOptions (
            "usb|u" => \$usb,
            "qnap|q" => \$qnap,
            "git|g" => \$git,
            "help|h" => \$help,
            ) or die "Dead.";

if ($help) {
  say "Usage: backup [--usb|u] [--git|g] [--help|-h]";
  exit 0;
} elsif (!defined $git && !defined $usb) {
  say "Please specify sync location(s)";
  say "Usage: backup [--usb|u] [--git|g] [--help|-h]";
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
