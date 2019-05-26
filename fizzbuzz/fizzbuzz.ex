defmodule FizzBuzz do
  def filter(i) do
    case { rem(i, 5) == 0, rem(i, 3) == 0 } do
      { true,  true  } -> "FizzBuzz"
      { false, true  } -> "Fizz"
      { true,  false } -> "Buzz"
      { false, false } -> i
    end
  end
  def run(i) do
    for j <- Range.new(1, i) do
      j |> filter |> IO.puts
    end
  end
end

FizzBuzz.run 100

