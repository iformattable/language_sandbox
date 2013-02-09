#light

let [|_;s|] = System.Environment.GetCommandLineArgs() 

let complement = function
  | 'A' -> 'T'
  | 'T' -> 'A'
  | 'C' -> 'G'
  | 'G' -> 'C'

let rev = s.ToCharArray() |> Array.rev 
let revComp = seq { for b in rev -> complement b }
revComp |> Seq.iter (string >> printf "%s")
printfn "%s" ""
