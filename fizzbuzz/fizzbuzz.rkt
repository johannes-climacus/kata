#lang racket

(for ([n (in-range 1 101)])
  (displayln
   (match (gcd n 15)
     [15 "FizzBuzz"]
     [3 "Fizz"]
     [5 "Buzz"]
     [_ n])))
