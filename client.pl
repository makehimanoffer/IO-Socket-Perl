#!/usr/bin/perl -w
# clientIO.pl - a simple client using
# IO::Socket
use strict;
use IO::Socket;
my $host = shift || 'localhost';
my $port = shift || 4001;
my $sock = new IO::Socket::INET(
                   PeerAddr => $host,
                   PeerPort => $port,
                   Proto    => 'tcp');
$sock or die "no socket :$!";
my $input;
my $reply;
while($reply ne "0"){

    print $sock "hello, world: $i\n";
}
close $sock;