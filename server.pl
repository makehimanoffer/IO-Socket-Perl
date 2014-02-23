#!/usr/bin/perl -w
# serverIO.pl - a simple server using
# IO::Socket
use strict;
use IO::Socket;
my $sock = new IO::Socket::INET(
                   LocalHost => 'localhost',
                   LocalPort => 4001,
                   Proto     => 'tcp',
                   Listen    => SOMAXCONN,
                   Reuse     => 1);
$sock or die "no socket :$!";

#host name, port number, protocol, queue length 
#and an option indicating we want this port to be immediately reusable
# they're the arguments passed into creating the socket.
#SOMAXCONN is maximum queue size that the system will accept.
# in IO::SOCKET the socket is used as a file handle.
my($client, $c_addr, $buf);
while (($client, $c_addr) = $sock->accept()) {
#this is the line that calls for the client accept
    my ($client_port, $c_ip) =
                     sockaddr_in($c_addr);
    my $client_ipnum = inet_ntoa($c_ip);
    my $client_host =
             gethostbyaddr($c_ip, AF_INET);
    print "got a connection from: $client_host",
          " [$client_ipnum]\n";
    while (defined ($buf = <$client>)) {
		print $client ("okay, what is your name?");
		
        print $buf;
    }
}