defmodule Greed do
  def tally(face, matches) when matches >= 3 do
    cond do
      face == 1 -> 1000
      face == 5 ->  500
      true      ->  100 * face
    end
  end
  def tally(face, matches) when matches < 3 do
    cond do
      face == 1 -> 100
      face == 5 ->  50
      true      ->   0
    end
  end
  def count(face, matches, score) do
    if matches == 0 do score else
      count(
        face,
        matches - if (matches >= 3) do 3 else 1 end,
        score + tally(face, matches)
      )
    end
  end
  def score rolls do
    rolls
    |> Enum.group_by(fn face -> face end)
    |> Enum.map(fn {face, matches} -> count(face, length(matches), 0) end)
    |> Enum.sum
  end
end

ExUnit.start()

defmodule GreedTest do
  use ExUnit.Case
  test "1 1 1 5 1" do assert Greed.score([1, 1, 1, 5, 1]) == 1150 end
  test "2 3 4 6 2" do assert Greed.score([2, 3, 4, 6, 2]) == 0    end
  test "3 4 5 3 3" do assert Greed.score([3, 4, 5, 3, 3]) == 350  end
  test "1 5 1 2 4" do assert Greed.score([1, 5, 1, 2, 4]) == 250  end
  test "5 5 5 5 5" do assert Greed.score([5, 5, 5, 5, 5]) == 600  end
end

