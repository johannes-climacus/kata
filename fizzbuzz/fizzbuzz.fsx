let rec gcd i j = if j = 0 then abs i else gcd j (i % j)

let fizzbuzz i =
  let filter j =
      match (gcd j 15) with
      | 15 -> "FizzBuzz"
      | 5  -> "Buzz"
      | 3  -> "Fizz"
      | _  -> string j

  [1..i] |> List.iter (filter >> printfn "%s")

fizzbuzz 100

