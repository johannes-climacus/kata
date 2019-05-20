let rec gcd i j = if j = 0 then abs i else gcd j (i % j)

let fizzbuzzer range =
  for each in range do
    match (gcd each 15) with
    | 15 -> "FizzBuzz"
    | 5  -> "Buzz"
    | 3  -> "Fizz"
    | _  -> each |> string
    |> printfn "%s"

fizzbuzzer [1..100]

