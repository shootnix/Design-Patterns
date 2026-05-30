use v5.42;
use feature 'class';
no warnings 'experimental::class';

class IState {
    method next()   { ... }
    method status() { ... }
}

class RedState :isa(IState) {
    method next()   { GreenState->new() }
    method status() { 'RED' }
}

class GreenState :isa(IState) {
    method next()   { YellowState->new() }
    method status() { 'GREEN' }
}

class YellowState :isa(IState) {
    method next()   { RedState->new() }
    method status() { 'YELLOW' }
}

class TrafficLight {
    field $state = RedState->new();
    method next()   { $state = $state->next() }
    method status() { printf "Light: %s\n", $state->status() }
}
