#!/usr/bin/env perl

use strict;

use Term::ReadKey;
ReadMode('cbreak');

select(STDOUT); $| =1 ;

use IO::Handle;
use IO::Select;

my $s = IO::Select->new();
$s->add(\*STDIN);

my $io = IO::Handle->new();
if ($io->fdopen(fileno(STDIN),"r")) {
}

while(1) {
    my @ready = $s->can_read(1);
    if (@ready) {
        $io->read(my $ch, 1);
        print $ch;
        next;
    }
}
