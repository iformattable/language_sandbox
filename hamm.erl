-module(hamm).
-export([dist/2]).

dist(S1,S2) ->
  dist(S1,S2,0).

dist([],_,D) -> D;
dist(_,[],D) -> D;
dist([B|S1],[B|S2], D) ->
  dist(S1, S2, D);
dist([_|S1],[_|S2], D) ->
  dist(S1, S2, D+1).
