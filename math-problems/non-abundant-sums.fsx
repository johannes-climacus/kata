#load "kata.fs"
open Kata

let properDivisors n =
  let build n h acc =
    if Math.isDivisible n h
    then acc @ [h]
    else acc
  let rec loop n lst acc =
    match lst with
    | []     -> acc
    | h :: t -> loop n t (build n h acc)
  loop n [1..(n - 1)] []

let isPerfect n = properDivisors n |> List.sum = n
let isAbundant n = properDivisors n |> List.sum > n
let isDeficient n = properDivisors n |> List.sum < n

let range = [1..28123]
let abundants = range |> List.filter isAbundant
let sums = List.cartesian abundants abundants (+)

let isNotSumOfTwoAbundants n = not (Seq.contains n sums)

range |> List.filter isNotSumOfTwoAbundants |> List.sum

