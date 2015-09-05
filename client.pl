#!/usr/bin/env perl
use v5.12;
use IO::Socket;
use lib '../lib';
use Fluxx::Engine::Card;

    
MAIN:{
    say "Hello, Monty Python Fluxx Client Ready!";
    say "Type \"New Game\" to begin the game.";
    say "Type \"Join\" to join an already existing game";
    while(<>){
        chomp $_;
        if ($_ eq 'New Game'){
            if(fork){
                say "Starting server";
                Join("127.0.0.1:4000")
            }
            else{
                exec('./server.pl', "127.0.0.1:4000") or die "Couldn't exec: $!";
            }
            last;
        }
        elsif ($_ eq 'Join'){
            say "Enter IP and Port";
            my $server = <>;
            Join($server);
            last;
        }
    }
}

sub Join{
    my $server = shift;
    my $sock = IO::Socket::INET->new('PeerAddr' => $server, 'ReuseAddr' => 1,
                                     'ReusePort' => 1, 'Blocking' => 1) or 
                                     die "failed to create socket: $!";
    say "What is your user name?";
    my $user = <>;
    print $sock $user;
    my $line = <$sock>;
    if($line eq 'OK'){
        while($line = <$sock>){
            if ($line ne 'END'){
            }
            else{
                last;
            }
        }
        Play($sock);
    }
}

sub Play{
    while(my $line = <$sock>){
        if ($line eq 'Play'/) {
             say "it's your move";
             my $input = <>;
             if ($input =~ /^play.*//){
                 print $sock $input;
             }
             else{
                 ParseInput($input);
             }
        }
        else {
             ParseResponse($line);
        }
    }
}


sub ParseInput{



}
