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
  reverse(filter_out(Array, Border, [])).


filter_out([], _, Saved) ->
  Saved;
filter_out([H|T], Border, Saved) when H=<Border ->
  filter_out(T, Border, [H|Saved]);
filter_out([_|T], Border, Saved) ->
  filter_out(T, Border, Saved).


reverse([]) ->
  [];
reverse (Array) ->
  do_reverse(Array, []).

do_reverse([], Acc) ->
  Acc;
do_reverse([H|T], Acc) ->
  do_reverse(T, [H|Acc]).
