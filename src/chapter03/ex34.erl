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
read(Key, [H|T]) ->
  HeadKey = element(1, H),
  HeadValue = element(2, H),
  case HeadKey of
    Key -> {ok, HeadValue};
    _Other -> read(Key, T)
  end.

match(Element, Db) ->
  collect(Element, Db, []).

collect(_Element, [], _Aggregator) ->
  [];
collect(Element, [H|T], Aggregator) ->
  HeadKey = element(1, H),
  HeadValue = element(2, H),
  case HeadValue of
    Element -> [HeadKey|collect(Element, T, Aggregator)];
    _Other -> collect(Element, T, Aggregator)
  end.

delete(Key, Db) ->
  collect_useful(Key, Db, []).

collect_useful(_Key, [], _Saved) ->
  [];
collect_useful(Key, [H|T], Saved) ->
  ElementHead = element(1, H),
  case ElementHead of
    Key -> collect_useful(Key, T, Saved);
    _Other -> [H|collect_useful(Key, T, Saved)]
  end.