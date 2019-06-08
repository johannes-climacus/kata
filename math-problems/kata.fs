namespace Kata

module Math =
  let factorial = function | 1 -> 1 | n -> [1..n] |> Seq.reduce (*)
  let isDivisible x y = x % y = 0
  let square n = n * n

module List =
  let ofDigits n = n |> string |> Seq.map(fun c -> int c - 48) |> List.ofSeq
  let cartesian a b fn = seq { for a in a do for b in b do yield fn a b } |> List.ofSeq

