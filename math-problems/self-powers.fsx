let series limit =
  [1I..limit]
  |> Seq.map(fun x -> pown x (int x))
  |> Seq.sum

series 1000I

