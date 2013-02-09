#light

let [|_;s|] = System.Environment.GetCommandLineArgs()
let rna = seq { 
  for b in s do 
    if 'T' = b then 
      yield 'U' 
    else 
      yield b 
}
printfn "%s" (new System.String([| for b in rna -> b|]))
