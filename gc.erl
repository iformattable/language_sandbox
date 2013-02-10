-module(gc).
-export([highest/1]).

highest(Filename) ->
  LabeledStrings = parseFasta(Filename),
  LabeledGcContent = [{L,computeGc(Dna)} || {L,Dna} <- LabeledStrings],
  Max = lists:max([X || {_,X} <- LabeledGcContent]),
  [{Label,GcContent}] = lists:filter(fun({_,C}) -> C == Max end, LabeledGcContent),
  io:fwrite("~s~n ~f~n", [Label, GcContent]).

parseFasta(File) ->
  {ok,Data} = file:read_file(File),
  [_|I] = binary:split(Data,<<">">>,[global]),
  P = [{L,D} || [L|D] <- [binary:split(X,<<"\n">>) || X <- I]],
  [{L, lists:filter(fun(X) -> X /= $\n end, binary_to_list(D))} || {L,[D]} <- P]. 

computeGc(Dna) ->
  Count = countGc(Dna, 0),
  Count / length(Dna) * 100.

countGc([], C) ->
  C;
countGc([B|Dna], C) when B == $G;B == $C ->
  countGc(Dna, C+1);
countGc([_|Dna], C) ->
  countGc(Dna, C).

  
  
