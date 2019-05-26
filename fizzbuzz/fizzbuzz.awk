#!/usr/bin/env awk -f

function filter(i) {
  if      (i % 15 == 0) return "FizzBuzz"
  else if (i %  5 == 0) return "Buzz"
  else if (i %  3 == 0) return "Fizz"
  else                  return i
}

function fizzbuzz(n) {
  for (i = 1; i <= n; i++) print filter(i)
}

BEGIN { fizzbuzz(100) }

