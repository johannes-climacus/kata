module Seq =
  let ofDigits number =
    number
    |> string
    |> Seq.map(fun c -> c |> string |> System.Int64.Parse)

let fib limit =
  Seq.unfold(fun (a, b) -> Some( a + b, (b, a + b))) (0I, 1I)
  |> Seq.takeWhile(fun x -> x <= limit )

fib (pown 10I 1500)
|> Seq.findIndex(fun x -> (x |> Seq.ofDigits |> Seq.length) = 1000)
// add one for index starting at zero and one for "double" beginning
|> (+) <| 2
|> printfn "%A"

