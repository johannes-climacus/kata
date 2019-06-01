let reverseString (s : string) = new string(Array.rev (s.ToCharArray()))

let isPalindrome (s : string) =
  let halve (s : string) = s.[..(((String.length s) / 2) - 1)]
  (halve s) = (s |> reverseString |> halve)

let isIntPalindrome (i : int) = i |> string |> isPalindrome ;;

let greatestPalindromeProduct digits =
  let top = (pown 10 digits) - 1
  let bottom = (top / 2) + (top / 3)
  let range = [bottom..top]
  range
  |> Seq.collect(fun a -> range |> Seq.map(fun b -> a, b))
  |> Seq.map(fun (x, y) -> x * y)
  |> Seq.filter isIntPalindrome
  |> Seq.max

if (greatestPalindromeProduct 2) = 9009 then "Passed" else "Failed"
|> printfn "%s"


#time ;;
greatestPalindromeProduct 2 ;;
greatestPalindromeProduct 3 ;;
greatestPalindromeProduct 4 ;;
#time ;;

