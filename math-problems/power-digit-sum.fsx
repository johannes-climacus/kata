module List =
  let ofDigits number =
    number
    |> string
    |> Seq.map(fun c -> c |> string |> System.Int64.Parse)
    |> List.ofSeq

pown 2I 1000
|> List.ofDigits
|> List.sum
|> printfn "%A"

