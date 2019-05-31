module BigIntMath =
  let isDivisible i j = i % j = 0I
  let isEven i = isDivisible i 2I
  let isOdd i = not (isEven i)
  let bigIntSqrt i = i |> float |> sqrt |> bigint

  let factors i = Set [1I..i] |> Set.filter(isDivisible i)

  let sieveOfEratosthenes limit =
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

  let isPrime i =
    let rec check i j =
      match i, j with
      | i, _   when i <= 1I            -> false
      | _, limit  when j < 2I          -> true
      | _, factor when isDivisible i j -> false
      | _, _                           -> check i (j - 1I)
    check i (i / 2I)

  let primeFactors i = factors i |> Set.filter isPrime

  let greatestPrimeFactor i = primeFactors i |> Set.maxElement

module BigIntMathTests =
  open BigIntMath

  let case name fn input expected =
    let grade = fn input = expected
    printfn " %s %s"
      (if grade then "✓" else "✗")
      name
    grade

  let tests = [
    case
      "Factors of 100"
      factors 100I
      (Set [1I; 2I; 4I; 5I; 10I; 20I; 25I; 50I; 100I])
    case
      "Sieve of Eratosthenes through 100"
      sieveOfEratosthenes 100I
      (Set [2I; 3I; 5I; 7I; 11I; 13I; 17I; 19I; 23I; 29I; 31I; 37I; 41I;
            43I; 47I; 53I; 59I; 61I; 67I; 71I; 73I; 79I; 83I; 89I; 97I])
    case "Prime Factors of 100" primeFactors 100I (Set [2I; 5I;])
    case "Greatest Prime Factor of 100" greatestPrimeFactor 100I 5I
  ]

  let run () =
    let isTrue b = b = true
    if tests |> List.forall isTrue
    then "All tests passed "
    else "Some tests failed"
    |> printfn "┏━━━━━━━━━━━━━━━━━━━┓\n┃ %s ┃\n┗━━━━━━━━━━━━━━━━━━━┛"

BigIntMathTests.run ()

