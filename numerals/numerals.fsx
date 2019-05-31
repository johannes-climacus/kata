module Map =
  let reverse map : Map<'a,'b> = 
    Map.fold
      (fun m key value -> m.Add(value, key))
      Map.empty map

module Numerals =
  type Convertable = Arabic of int | Roman of string

  let conversions = Map [('M', 1000)
                         ('D',  500)
                         ('C',  100)
                         ('L',   50)
                         ('X',   10)
                         ('V',    5)
                         ('I',    1)]

  let toRoman (digits : int) =
    let rec breakdown i acc =
      let rec divide i j acc k =
        if k = 0 || i < j
        then acc
        else divide i j (acc @ [j]) (k - 1)
      function
        | [] -> acc
        | h :: t -> breakdown (i % h) (divide i h acc (i / h)) t

    let values = [1000; 500; 100; 50; 10; 5; 1]

    let numeralize i =
      match (Map.reverse conversions).TryFind(i) with
      | Some(numeral) -> numeral
      | None          -> ' '

    breakdown digits [] values
    |> Seq.map numeralize
    |> System.String.Concat
    |> fun str ->
        str
         .Replace("DCCCC", "CM")
         .Replace("CCCC" , "CD")
         .Replace("LXXXX", "XC")
         .Replace("XXXX" , "XL")
         .Replace("VIIII", "IX")
         .Replace("IIII" , "IV")

  let toArabic (numerals : string) =
    let digitize s =
      match conversions.TryFind(s) with
      | Some(digits) -> digits
      | None         -> 0

    numerals
      .Replace("CM", "DCCCC")
      .Replace("CD", "CCCC" )
      .Replace("XC", "LXXXX")
      .Replace("XL", "XXXX" )
      .Replace("IX", "VIIII")
      .Replace("IV", "IIII" )
    |> Seq.toList
    |> Seq.map(fun c -> digitize c)
    |> Seq.sum


  let convert =
    function
      | Arabic (i) -> toRoman   i |> Roman
      | Roman  (s) -> toArabic  s |> Arabic


module Test =
  open Numerals

  let case input expected =
    sprintf "%A -> %A %s"
      input
      expected
      (if convert input = expected
       then "Passed"
       else "Failed")

  let cases = [
    case (Arabic 1222)   (Roman "MCCXXII")
    case (Arabic 3108)   (Roman "MMMCVIII")
    case (Arabic 1664)   (Roman "MDCLXIV")
    case (Roman "LXX")   (Arabic 70)
    case (Roman "XLIX")  (Arabic 49)
    case (Roman "CMXXI") (Arabic 921)
  ]

Test.cases |> Seq.iter(fun s -> printfn "%s" s)

