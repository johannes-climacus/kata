let isDivisible i j = i % j = 0I ;;
let isEven i = isDivisible i 2I ;;
let isOdd i = not (isEven i) ;;
let bigIntSqrt (i : bigint) = i |> float |> sqrt |> bigint ;;

let sieveOfEratosthenes (limit : bigint) =
  let baseRange =
    [2I..limit]
    |> Set.ofSeq
    |> Set.filter(fun i -> i = 2I || isOdd i)

  let limitedSquares =
    baseRange
    |> Set.filter(fun i -> i < bigIntSqrt limit)
    |> Set.toList

  let rec crossOff squares set =
    let filterer i j = not (isDivisible i j) || i = j
    match squares with
    | [] -> set
    | h :: t -> crossOff t (set |> Set.filter(fun x -> filterer x h))

  crossOff limitedSquares baseRange

sieveOfEratosthenes 2000000I
|> Set.toSeq
|> Seq.sum
|> printfn "%A"

