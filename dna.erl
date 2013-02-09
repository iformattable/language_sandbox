-module(dna).
-export([count/1]).

count(Dna) ->
  count(Dna, {0,0,0,0}).

count([], {A,C,G,T}) ->
  io:fwrite("~B ~B ~B ~B~n", [A,C,G,T]);
count([B|Dna], {A,C,G,T}) when B == $A ->
  count(Dna, {A+1,C,G,T});
count([B|Dna], {A,C,G,T}) when B == $C ->
  count(Dna, {A,C+1,G,T});
count([B|Dna], {A,C,G,T}) when B == $G ->
  count(Dna, {A,C,G+1,T});
count([B|Dna], {A,C,G,T}) when B == $T ->
  count(Dna, {A,C,G,T+1}).
