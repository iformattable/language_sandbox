#light

let rec count a c g t = function
  | 'A'::s -> count (a+1) c g t s
  | 'C'::s -> count a (c+1) g t s
  | 'G'::s -> count a c (g+1) t s
  | 'T'::s -> count a c g (t+1) s
  | _ -> printfn "%d %d %d %d" a c g t

let [|_;s|] = System.Environment.GetCommandLineArgs() 
count 0 0 0 0 (s.ToCharArray() |> Seq.toList)
