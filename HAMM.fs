#light

let rec dist h = function
  | (a::s1,b::s2) when a = b -> dist h     (s1,s2)
  | (_::s1,_::s2)            -> dist (h+1) (s1,s2)
  | _ -> printfn "%d" h

let [|_;s1;s2|] = System.Environment.GetCommandLineArgs()

dist 0 (Seq.toList <| s1.ToCharArray(), Seq.toList <| s2.ToCharArray())
