#!/usr/bin/perl
use strict;
use warnings;
my $REMOTE_HOST = "192.168.203.109";
my $FILE = "/fenua/scripts/status.out";
# Utiliser SSH pour récupérer le contenu du fichier de la machine distante
my $status = `/usr/bin/ssh $REMOTE_HOST "cat $FILE" 2>&1`;
chomp $status;
if ($status eq "1") {
    print "OK: La base de donnée FENUA est active\n";
    exit 0;
}
elsif ($status eq "0") {
    print "WARNING: La base de donnée FENUA est inactive\n";
    exit 1;
}
else {
    print "UNKNOWN: Unable to determine database status - $status\n";
    exit 3;
}
~   