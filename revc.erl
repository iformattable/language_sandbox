-module(revc).
-export([reverse_complement/1]).

comp(B) when B == $A -> $T;
comp(B) when B == $T -> $A;
comp(B) when B == $G -> $C;
comp(B) when B == $C -> $G.

reverse_complement(S) ->
  rev_c(S,[]).

rev_c([], C) ->
  C;
rev_c([B|Dna], C) ->
  rev_c(Dna, [comp(B)] ++ C).
