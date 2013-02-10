-module(rna).
-export([transcode/1]).

transcode(Dna) ->
  transcode(Dna,[]).

transcode([],Rna) ->
  Rna;
transcode([$T|Dna],Rna) ->
  transcode(Dna, Rna ++ [$U]);
transcode([B|Dna],Rna) ->
  transcode(Dna, Rna ++ [B]).
