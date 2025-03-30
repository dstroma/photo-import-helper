#!/usr/bin/perl
use v5.34;
use FindBin;
use lib "$FindBin::Bin/../lib";
use PIH;

my $arg = $ARGV[0];
if ($arg eq '--cli') {
  eval "use PIH::CLI; 1" or die $@;
  PIH::CLI->main();
} else {
  eval "use PIH::GUI; 1" or die $@;
  PIH::GUI->main();
}

