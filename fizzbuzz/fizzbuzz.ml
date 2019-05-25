let range i j = List.init j (fun x -> x + i);;
let rec gcd i j = if j = 0 then abs i else gcd j (i mod j);;
let (>>) f g x = g(f(x));;

let fizzbuzz i =
  match (gcd i 15) with
  | 15 -> "FizzBuzz"
  | 5  -> "Buzz"
  | 3  -> "Fizz"
  | _  -> string_of_int i
;;

range 1 100 |> List.iter (fizzbuzz >> (Printf.printf "%s\n"));;

