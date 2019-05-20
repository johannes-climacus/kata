let rec gcd i j = if j = 0 then abs i else gcd j (i % j)

let fizzbuzz i =
    match (gcd i 15) with
    | 15 -> "FizzBuzz"
    | 5  -> "Buzz"
    | 3  -> "Fizz"
    | _  -> string i

[1..100] |> List.iter (fizzbuzz  >> printfn "%s")

