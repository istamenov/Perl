#!/usr/bin/env perl

use v5.12;
use strict;
use warnings; 

@ARGV = '127.0.0.1:4000' unless @ARGV;
use IO::Socket;


my $sock = IO::Socket::INET->new(LocalAddr => @ARGV, Proto => 'tcp',
                                 Listen => 2, ReuseAddr => 1,
                                 ReusePort => 1) or die "Server creation: $!";
while(my $cli = $sock->accept()){
    my $line = <$cli>;
    print $cli $line;
    close($cli);
}
