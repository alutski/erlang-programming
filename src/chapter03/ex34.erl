%%%-------------------------------------------------------------------
%%% @doc
%%% Excercise 3-4: p.83. Database handling using lists
%%% @end
%%%-------------------------------------------------------------------
-module(ex34).
-export([new/0, destroy/1, write/3, read/2, match/2, delete/2]).
-author("Anatol Lutski <alutski@gmail.com>").

new() ->
  [].

destroy(_Db) ->
  ok.

write(Key, Element, Db) ->
  [{Key, Element}|Db].

read (_Key, []) ->
  {error, instance};
read (Key, [{Key,Value}|_T]) ->
  {ok, Value};
read (Key, [{_,_}|T])->
  read(Key, T).

match(Element, Db) ->
  collect_matching(Element, Db, []).

collect_matching(_Element, [], _Aggregator) ->
  [];
collect_matching(Element, [{HeadKey,Element}|T], Aggregator) ->
  [HeadKey|collect_matching(Element, T, Aggregator)];
collect_matching(Element, [_|T], Aggregator) ->
  collect_matching(Element, T, Aggregator).

delete(Key, Db) ->
  collect_saved(Key, Db, []).

collect_saved(_Key, [], _Saved) ->
  [];
collect_saved(Key, [{Key,_}|T], Saved) ->
  collect_saved(Key, T, Saved);
collect_saved(Key, [{H,_}|T], Saved) ->
  [H|collect_saved(Key, T, Saved)].
