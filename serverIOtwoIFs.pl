use IO::Socket::INET;
use strict;

my $port = shift|| 4001
    or die"Missing port number\n";

my $socket = IO::Socket::INET->new('LocalPort' => $port,
				   'Proto' => 'tcp',
				   'Listen' => SOMAXCONN)
    or die "Can't create socket ($!)\n";

while (my $client = $socket->accept) {
    my $name = gethostbyaddr($client->peeraddr, AF_INET);
    my $port = $client->peerport;
    while (<$client>) {#while client is connected.
	
	
	print $client "Hello what's your name\n";
	$_= <$client>;#take input from client
	print "$_";
	my $bla= $_; #assign to variable
	chomp($bla);# chomp variable
	if($bla =~/^randal\b/i){ #use variable in comparison
		print $client "Hello randal \n"; 
		close $client or die "can't close"; 
		close $socket or die "can't close"; 
	}else{
		print $client "Hello $bla ,since you're not Randal, whats the secret word?\n";
		
		$_= <$client>;
		$bla= $_;
		chomp($bla);
		print "$_";
		while($bla ne "camel" || $bla ne "alpaca" || $bla ne "llama"){
			print $client "Wrong try again,what is the secret word?";
			$_= <$client>;
			$bla= $_;
			chomp($bla);
			print "$_";
			
		}
		
		print $client "That's correct";
		}
	close $client
		or die "can't close";
    }
    close $client
	or die "Can't close ($!)\n";
}
die "Can't accept socket ($!)\n";