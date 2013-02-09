#light

let rec dist h = function
  | (a::b1s,b::b2s) when a = b -> dist h (b1s,b2s)
  | (_::b1s,_::b2s)            -> dist (h+1) (b1s,b2s)
  | _ -> printfn "%d" h

let [|_;s1;s2|] = System.Environment.GetCommandLineArgs()

dist 0 (Seq.toList <| s1.ToCharArray(), Seq.toList <| s2.ToCharArray())
