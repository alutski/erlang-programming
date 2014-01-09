%%%-------------------------------------------------------------------
%%% @doc
%%% Excercise 3-3: p.83
%%% @end
%%%-------------------------------------------------------------------
-module(ex33).
-export([print/1]).
-author("Anatol Lutski <alutski@gmail.com>").


print(N) when N > 1 ->
  print(N-1), io:format("Number: ~p~n", [N]);
print(1) ->
  io:format("Number: ~p~n", [1]).