let fib limit =
  Seq.unfold(fun (a, b) -> Some( a + b, (b, a + b))) (0, 1)
  |> Seq.takeWhile(fun x -> x <= limit )
  |> Seq.toList

let isEven i = i % 2 = 0

let sumEvenFibs i =
  fib i
  |> Seq.filter isEven
  |> Seq.sum

