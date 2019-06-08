let champer range nths =
  let digitsOfRange =
    range
    |> List.map string
    |> String.concat ""
    |> List.ofSeq
    |> List.map(fun c -> int c - 48)
  let rec loop range nths acc =
    match nths with
    | []     -> acc
    | h :: t -> loop range t (acc @ [(digitsOfRange |> List.item (h - 1))])
  loop range nths []
  |> List.reduce (*)

champer
  [1..1000000]
  [1; 10; 100; 1000; 10000; 100000; 1000000]
|> printfn "%i"

