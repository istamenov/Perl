#!/usr/bin/env perl

package Fluxx::Engine::Board;
#this package defines the Board that all players share
use Moose;# use strict, use warnings

has 'DrawPile' => (is => 'rw', isa => 'ArrayRef[Fluxx::Engine::Card]');
has 'DiscardPile' => (is => 'rw', isa => 'ArrayRef[Fluxx::Engine::Card]');
has 'GoalAndRuleCards' => (is => 'rw', isa => 'ArrayRef[Str]');
has 'Player1' => (is => 'rw', isa => 'Fluxx::Engine::Player');
has 'Player2' => (is => 'rw', isa => 'Fluxx:Engine::Player');

1;
