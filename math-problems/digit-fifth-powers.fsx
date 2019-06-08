#load "BigFun.fs"
open BigFun

let digitsToPower n p =
  n
  |> List.ofDigits
  |> List.map(fun x -> pown x p)
  |> List.sum

let isDigitPower n p = digitsToPower n p = n

[2..100000]
|> Seq.filter(fun x -> isDigitPower x 4)
|> Seq.sum
|> printfn "%i"

