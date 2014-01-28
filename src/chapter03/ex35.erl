%%%-------------------------------------------------------------------
%%% @doc
%%% Excercise 3-5: p.84. Manipulating Lists
%%% @end
%%%-------------------------------------------------------------------
-module(ex35).
-export([filter/2, reverse/1]).
-author("Anatol Lutski <alutski@gmail.com>").


filter([], _) ->
  [];
filter(Array, Border) ->
  reverse(filter(Array, Border, [])).


filter([], _, Saved) ->
  Saved;
filter([H|T], Border, Saved) when H=<Border ->
  filter(T, Border, [H|Saved]);
filter([_|T], Border, Saved) ->
  filter(T, Border, Saved).


reverse([]) ->
  [];
reverse (Array) ->
  reverse(Array, []).

reverse([], Acc) ->
  Acc;
reverse([H|T], Acc) ->
  reverse(T, [H|Acc]).
