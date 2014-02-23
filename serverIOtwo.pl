#!/usr/bin/perl -w
# this is the server that will deal with ADDING Choices and MoreThanOneSecretWord
use strict;
use IO::Socket;
use Sys::Hostname;
my $sock = new IO::Socket::INET(
                   LocalHost => 'localhost',
                   LocalPort => 4001,
                   Proto     => 'tcp',
                   Listen    => SOMAXCONN,
                   Reuse     => 1);
$sock or die "no socket :$!";
STDOUT->autoflush(1);
my($new_sock, $buf);

while ($new_sock = $sock->accept()) {
    # got a client connection, so read
    # line by line until end-of-file
    while (defined($buf = <$new_sock>)) {
   
	my $default= "default";
   while($buf ne "0") {
   
   
            if($buf eq "HELLO\n"){
				
                 print($new_sock "What's your name\n");
				 print("$buf is this here");
				 $default="default";
				}
	
#this is the bit for the adding choices part of the question.
# so basically as part of the switch statement. 
			if($buf eq "David\n"){
				print("$buf is this here");
				print($new_sock "Hello, David, how good of you to be here\n");
				print("$buf is this here");
				
				}
			
            else{
				print($new_sock "Hello, $buf, how good of you to be here\n");
				}
   }
    }
    close $new_sock;
}