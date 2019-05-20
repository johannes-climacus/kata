#lang racket

(for ([n (in-range 1 101)])
  (displayln (match (gcd n 15)
               [15 "FizzBuzz"]
               [5 "Buzz"]
               [3 "Fizz"]
               [_ n])))
