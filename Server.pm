#!/usr/bin/env perl

package Fluxx::Engine::Server
use Moose;

has 'Engine' (is => 'rw', isa => 'Fluxx::Engine::Engine');


1;
