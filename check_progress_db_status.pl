#!/usr/bin/perl
use strict;
use warnings;
my $REMOTE_HOST = "YOUR_DB_IP_ADRESS";
my $FILE = "/your/script/status.out";
# Use SSH to get status out from progress server
my $status = `/usr/bin/ssh $REMOTE_HOST "cat $FILE" 2>&1`;
chomp $status;
if ($status eq "1") {
    print "OK: Database is active\n";
    exit 0;
}
elsif ($status eq "0") {
    print "WARNING: Database is inactive\n";
    exit 1;
}
else {
    print "UNKNOWN: Unable to determine database status - $status\n";
    exit 3;
}
~   