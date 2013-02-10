-module(dna).
-export([count/1]).

count(Dna) ->
  count(Dna, {0,0,0,0}).

count([], {A,C,G,T}) ->
  io:fwrite("~B ~B ~B ~B~n", [A,C,G,T]);
count([$A|Dna], {A,C,G,T}) ->
  count(Dna, {A+1,C,G,T});
count([$C|Dna], {A,C,G,T}) ->
  count(Dna, {A,C+1,G,T});
count([$G|Dna], {A,C,G,T}) ->
  count(Dna, {A,C,G+1,T});
count([$T|Dna], {A,C,G,T}) ->
  count(Dna, {A,C,G,T+1}).
