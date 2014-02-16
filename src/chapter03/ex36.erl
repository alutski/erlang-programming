%%%-------------------------------------------------------------------
%%% @doc
%%% Excercise 3-6: p.85. Sorting Lists
%%% @end
%%%-------------------------------------------------------------------
-module(ex36).
-export([quicksort/1, mergesort/1]).
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


mergesort([]) ->
  [];
mergesort([X|[]]) -> [X];
mergesort(List) ->
  {Left, Right} = splitInTwoChunks(List),
   merge(mergesort(Left), mergesort(Right)).

splitInTwoChunks(List) ->
  splitInTwoChunks(List, [], []).

splitInTwoChunks([], Left, Right) -> {Left, Right};
splitInTwoChunks([H|T], Left, Right) ->
  if length(Left) >= length(Right) -> splitInTwoChunks(T, Left, [H|Right]);
    length(Left) < length(Right) -> splitInTwoChunks(T, [H|Left], Right)
  end.


merge(X, []) -> X;
merge([], Y) -> Y;
merge([HeadX|TailX], [HeadY|TailY]) ->
  if HeadX =< HeadY -> [HeadX] ++ merge(TailX, [HeadY|TailY]);
    HeadX > HeadY -> [HeadY] ++ merge ([HeadX|TailX], TailY)
  end.

