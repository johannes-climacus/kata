let collatz n =
  let step n =
    match n % 2I = 0I with
    | true  -> n / 2I
    | false -> (3I * n) + 1I
  let rec loop n lst =
    let result = lst @ [n]
    if n = 1I
    then result
    else loop (step n) result
  loop n []

[1I..1000000I]
|> Seq.map collatz
|> Seq.map(fun x -> List.head x, Seq.length x)
|> Seq.maxBy snd
|> printfn "%A"

