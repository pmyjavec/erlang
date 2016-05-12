-module(lib_misc).
-export([tupple_to_list/1,test/0]).

test() ->
    [1,2,3] = tupple_to_list({1,2,3}),
    tests_worked.

tupple_to_list(T) when is_tuple(T) ->
        Len = tupple_size(T) + 1
        Iterate = fun(T,Len,N) ->
                    element(N, T);
                  end.
