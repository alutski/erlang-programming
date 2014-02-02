%%%-------------------------------------------------------------------
%%% @doc
%%% Excercise 3-5: p.84. Manipulating Lists
%%% @end
%%%-------------------------------------------------------------------
-module(ex35).
-export([filter/2, reverse/1, concatenate/1, flatten/1]).
-author("Anatol Lutski <alutski@gmail.com>").


filter([], _) ->
  [];
filter(List, Border) ->
  reverse(filter(List, Border, [])).

filter([], _, Saved) ->
  Saved;
filter([H|T], Border, Saved) when H=<Border ->
  filter(T, Border, [H|Saved]);
filter([_|T], Border, Saved) ->
  filter(T, Border, Saved).


reverse([]) ->
  [];
reverse (List) ->
  reverse(List, []).

reverse([], Acc) ->
  Acc;
reverse([H|T], Acc) ->
  reverse(T, [H|Acc]).


concatenate(List) ->
  flatten(List).


flatten([]) ->
  [];
flatten(List) ->
  reverse(flatten(List, [])).

flatten([], Acc) ->
  Acc;
flatten([H|T], Acc) when is_list(H) ->
  flatten(T, flatten(H, Acc));
flatten([H|T], Acc) ->
  flatten(T, [H|Acc]).







