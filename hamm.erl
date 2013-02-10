-module(hamm).
-export([dist/2]).

dist(S1,S2) ->
  dist(S1,S2,0).

dist([],_,D) -> D;
dist(_,[],D) -> D;
dist([B1|S1],[B2|S2], D) when B1 == B2 ->
  dist(S1, S2, D);
dist([_|S1],[_|S2], D) ->
  dist(S1, S2, D+1).
