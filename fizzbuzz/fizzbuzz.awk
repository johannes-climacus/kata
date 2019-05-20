#!/usr/bin/env awk -f
function fizzbuzz(i) {
  if      (i % 15 == 0) return "FizzBuzz"
  else if (i %  5 == 0) return "Buzz"
  else if (i %  3 == 0) return "Fizz"
  else                  return i
}
BEGIN { for (i = 1; i <= 100; i++) print fizzbuzz(i) }

