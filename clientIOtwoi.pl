use IO::Socket::INET;
use strict;

my $name = shift|| 'localhost'
    or die "Missing server name\n";
my $port = shift|| 4001
    or die "Missing port number\n";

my $socket = IO::Socket::INET->new('PeerAddr' => $name,
				   'PeerPort' => $port,
				   'Proto' => 'tcp')
    or die "Can't create socket ($!)\n";
print "Press enter to begin\n";

while (<STDIN>) {
	print "$_";
    print $socket $_;
    print scalar <$socket>;
}
close $socket
    or die "Can't close socket ($!)\n";