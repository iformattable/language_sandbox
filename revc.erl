-module(revc).
-export([reverse_complement/1]).

comp($A) -> $T;
comp($T) -> $A;
comp($G) -> $C;
comp($C) -> $G.

reverse_complement(S) ->
  rev_c(S,[]).

rev_c([], C) ->
  C;
rev_c([B|Dna], C) ->
  rev_c(Dna, [comp(B)] ++ C).
