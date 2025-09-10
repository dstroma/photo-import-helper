#!/usr/bin/perl
use v5.34;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Getopt::Long;
use PIH;

# Parse Options #######################
my $cli;
my $local_dir;
my $remote_dir;

GetOptions(
  'cli'          => \$cli,
  'remote-dir=s' => \$remote_dir,
  'local-dir=s'  => \$local_dir
);

PIH::set_remote_photos_dir($remote_dir) if $remote_dir;
PIH::set_local_photos_dir($local_dir)   if $local_dir;

# Main ################################
if ($cli) {
  eval "use PIH::CLI; 1" or die $@;
  PIH::CLI->main();
} else {
  eval "use PIH::GUI; 1" or die $@;
  PIH::GUI->main();
}
