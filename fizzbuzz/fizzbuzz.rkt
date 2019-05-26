#lang racket

(define (fizzbuzz i)
  (define (filter n)
    (match (gcd n 15)
      [15 "FizzBuzz"]
      [5 "Buzz"]
      [3 "Fizz"]
      [_ n]))

  (for ([n (in-range 1 (+ i 1))]) (displayln (filter n))))

(fizzbuzz 100)

