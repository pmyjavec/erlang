-module(shop).
-export([total/1]).
-import(lists, [map/2, sum/1]).

cost(apple)  -> 10;
cost(peach)  -> 19;
cost(zucini) -> 8;
cost(grapes) -> 4.

total(L) -> sum(map( fun({What, N}) -> (cost(What) * N) end, L )).
