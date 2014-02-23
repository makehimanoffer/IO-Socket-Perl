#!/usr/bin/perl -w
# client2way.pl - a client that writes to
# and reads from a server
use strict;
use IO::Socket;
my $host = shift || 'localhost';
my $port = shift || 4001;
my $sock = new IO::Socket::INET(
                  PeerAddr => $host,
                  PeerPort => $port,
                  Proto    => 'tcp');
$sock or die "no socket :$!";
# send message to server
my $response;
print $sock "HELLO\n";
# print server response to STDOUT
print scalar <$sock>; #what is your name
# send and print more stuff
$response= <STDIN>;
print $sock "$response\n"; #return name
print scalar <$sock>; #hello X
print scalar <$sock>; 
my $word= <$sock>;
print "$word";

if($word eq "What is the secret word? \n"){
	
	while( <$sock> ne "you are correct\n"){
	
	$response= <STDIN>;
	print $sock "$response"; #send response
	print scalar <$sock>; 
	print scalar <$sock>;
	
	
	
	
	
	
	}
	last;
	
	}
	last;
	$response= <STDIN>;
	
	


close $sock;