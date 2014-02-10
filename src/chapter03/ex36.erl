%%%-------------------------------------------------------------------
%%% @doc
%%% Excercise 3-6: p.85. Sorting Lists
%%% @end
%%%-------------------------------------------------------------------
-module(ex36).
-export([quicksort/1]).
-author("Anatol Lutski <alutski@gmail.com>").


quicksort([]) ->
  [];
quicksort([Etalon|T]) ->
  {Smaller, Larger} = split(Etalon, T, [], []),
  quicksort(Smaller) ++ [Etalon] ++ quicksort(Larger).

split(_, [], Smaller, Larger) -> {Smaller, Larger};
split (Etalon, [H|T], Smaller, Larger) ->
  if H =< Etalon -> split(Etalon, T, [H|Smaller], Larger);
    H > Etalon -> split(Etalon, T, Smaller, [H|Larger])
    end.

