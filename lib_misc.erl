-module(lib_misc).
-export([tuple_to_list/1,test/0, timer/1]).
-compile({no_auto_import,[tuple_to_list/1]}).

% tests
test() ->
    [1,2,3] = tuple_to_list({1,2,3}),
    tests_worked.

% Converts tuples to lists
tuple_to_list(T) when is_tuple(T), size(T) == 0 -> [];
tuple_to_list(T) when is_tuple(T), size(T) > 0 ->
    [ element(I, T) || I <- lists:seq(1, size(T))].

% Returns the time it taktes to run a fun
timer(F) ->
    Start = now(),
    F(),
    End  = now(),
    [ element(I, End) - element(I, Start) || I <- lists:seq(1, size(Start)) ].
