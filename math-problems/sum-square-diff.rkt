#lang racket
(require threading)

(define (fizzbuzz x)
  (define (buzzer n)
    (match (gcd n 15)
      [15 "FizzBuzz"]
      [5 "Buzz"]
      [3 "Fizz"]
      [_ n]))

  (for ([n (in-naturals)]
        #:when  (> n      0)
        #:break (= n (+ 1 x)))
    (~> n buzzer displayln)))

(fizzbuzz 100)
