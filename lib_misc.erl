-module(lib_misc).
-export([tuple_to_list/1,test/0]).
-compile({no_auto_import,[tuple_to_list/1]}).

test() ->
    [1,2,3] = tuple_to_list({1,2,3}),
    tests_worked.

tuple_to_list(T) when is_tuple(T), size(T) == 0 -> [];
tuple_to_list(T) when is_tuple(T), size(T) > 0 ->
    [ element(I, T) || I <- lists:seq(1, size(T))].


