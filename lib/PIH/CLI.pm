use v5.34;
use experimental 'signatures';
package PIH::CLI {

  sub main {
    index_remote_files();
    exit 0;

    say 'Welcome to the Photo Import Helper!';
    say 'Please Select an Option:';
    say '  1. Process and Import from Memory Card';
    say '  2. Clean Up Memory Card';
    say '  3. Quit';
  }

  sub index_remote_files {
    say 'Indexing removable media directory: ' . PIH::debug_remote_photos_dir;
    my $rfiles = PIH::index_files('remote');
    say "Remote files found: $rfiles";
    say '';

    say 'Indexing local media directory: ' . PIH::debug_local_photos_dir;
    my $lfiles = PIH::index_files('local');
    say "Local files found: $lfiles";
    say '';

    say 'Analyzing file list...';

    #my @remote_on_local = PIH::remote_files_on_local();
    #say 'The following files on your memory card HAVE ALREADY been copied to your PC:';
    #say for @remote_on_local;

    my @remote_novel = PIH::remote_files_not_on_local();
    say 'The following files on your memory card are NEW and have yet to be copied to your PC:';
    say for @remote_novel;
  }
}

1;
