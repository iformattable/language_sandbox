#light

let [|_;f|] = System.Environment.GetCommandLineArgs()

let dnas = seq {
  let lines = System.IO.File.ReadAllLines(f)
  let delimiterIndices = [|
    for i in 0..lines.Length - 1 do 
      if (lines.[i].StartsWith(">")) then 
        yield i 
  |]
  for d in 0..delimiterIndices.Length-1 do
    let i = delimiterIndices.[d]
    let labelLine = lines.[i]
    let label = labelLine.[1..] 
    let lastDnaLineIndex = 
      if d + 1 < delimiterIndices.Length then 
        delimiterIndices.[d+1] - 1 
      else lines.Length-1
    let dnaLines = [| for l in (i+1)..lastDnaLineIndex-> lines.[l] |]
    let dna = System.String.Concat dnaLines
    let gcCount = dna.ToCharArray() |> Seq.filter (fun b -> b = 'G' || b = 'C') |> Seq.length
    let gc = float32 gcCount / float32 dna.Length * 100.0f
    yield (label, gc)
}

let maxgc = Seq.maxBy (fun (_,gc) -> gc) <| dnas
//let result = dnas |> Seq.find (fun (_,gc) -> gc = maxgc)
printfn "%s" (fst maxgc)
printfn "%f" (snd maxgc)




