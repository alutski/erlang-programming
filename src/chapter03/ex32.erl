%%%-------------------------------------------------------------------
%%% @doc
%%% Excercise 3-2: p.83
%%% @end
%%%-------------------------------------------------------------------
-module(ex32).
-export([create/1, reverse_create/1]).
-author("Anatol Lutski <alutski@gmail.com>").

create(N) -> create_acc(N, 1).

create_acc(N, Val) when N == Val ->
  [N];
create_acc(N, Val) -> [Val|create_acc(N, Val+1)].


reverse_create(N) when N == 1 ->
  [1];
reverse_create(N) ->
  [N|reverse_create(N-1)].







