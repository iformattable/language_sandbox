#light

let rec count a c g t = function
  | 'A'::nbs -> count (a+1) c g t nbs
  | 'C'::nbs -> count a (c+1) g t nbs
  | 'G'::nbs -> count a c (g+1) t nbs
  | 'T'::nbs -> count a c g (t+1) nbs
  | _ -> printfn "%d %d %d %d" a c g t

let [|_;s|] = System.Environment.GetCommandLineArgs() 
count 0 0 0 0 (s.ToCharArray() |> Seq.toList)
