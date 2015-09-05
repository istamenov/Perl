#!/usr/bin/env perl

package Fluxx::Engine::Engine;
#the package defines the Fluxx Engine
use Moose;
use IO::Socket;

has 'Board' => (is => 'rw', isa => 'Fluxx::Engine::Board', required => 1);
has 'Rules' => (is => 'rw', isa => 'Fluxx::Engine::Rules', required => 0,
                                  defaullt => Fluxx::Engine::Rules->new);

sub play{
    my ($self, $player, $card) = @_;
    $self->Board->$player->$card->Effect($self);
}

1;
