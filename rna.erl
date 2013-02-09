-module(rna).
-export([transcode/1]).

transcode(Dna) ->
  transcode(Dna,[]).

transcode([],Rna) ->
  Rna;
transcode([B|Dna],Rna) when B == $T ->
  transcode(Dna, Rna ++ [$U]);
transcode([B|Dna],Rna) ->
  transcode(Dna, Rna ++ [B]).
