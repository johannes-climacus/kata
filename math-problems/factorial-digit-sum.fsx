module BigIntMath =
  let factorial n = seq [1I..n] |> Seq.reduce (*)

module Seq =
  let ofDigits number =
    number
    |> string
    |> Seq.map(fun c -> c |> string |> System.Int64.Parse)

BigIntMath.factorial 100I
|> Seq.ofDigits
|> Seq.sum
|> printfn "%A"

