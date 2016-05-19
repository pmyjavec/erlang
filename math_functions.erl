-module(math_functions).
-export([even/1,odd/1, test/0, filter/2, odds_and_evens1/1, odds_and_evens2/1]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TESTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
test() ->
    true = even(40),
    false = even(39),
    true = odd(37),
    false = odd(20),
    [2,4] = test_filter(),
    {[2,4], [1,3]} = odds_and_evens1([1,2,3,4]),
    {[30,20], [3,11]} = odds_and_evens2([11,20,3,30]),
    tests_passed.

test_filter() ->
    F = fun (X) -> even(X) end,
    filter(F,[1,2,3,4]).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

even(I) when (I rem 2) == 0 ->
    true;
even(I) when (I rem 2) /= 0 ->
    false.

odd(I) ->
    not(even(I)).

filter(F,L) -> [ X || X <- L, F(X) == true ].

% Example without accumulator
odds_and_evens1(L) ->
    E  = fun (X) -> even(X) end,
    O  = fun (X) -> odd(X) end,
    {filter(E,L), filter(O,L)}.

% Using the accumulator pattern
odds_and_evens2(L) ->
    quick_split(L, [], []).

quick_split([H|T], Odds, Evens) ->
    case (H rem 2) of
        1 -> quick_split(T, [H|Odds], Evens);
        0 -> quick_split(T, Odds, [H|Evens])
    end;
quick_split([], Odds, Evens) ->
    {Evens, Odds}.
