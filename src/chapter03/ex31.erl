%%%-------------------------------------------------------------------
%%% @doc
%%% Excercise 3-1: p.82
%%% @end
%%%-------------------------------------------------------------------
-module(ex31).
-export([sum/1, sum/2]).
-author("Anatol Lutski <alutski@gmail.com>").

%% given the positive integer N, function will return the sum of all the integers between 1 and N
sum(1) ->
  1;
sum(N) when N < 1 ->
  {error, 'argument has to be greater or equal to 1'};
sum(Number) ->
  Number+sum(Number-1).

%% given two integers N and M, where N=<M, function will return the sum of interval between N and M
sum (N, M) when N > M ->
  {error, 'the first argument has to be less or equls to the second argument'};
sum (N, M) when N == M ->
  N;
sum (N, M) ->
  N + sum(N + 1, M).




