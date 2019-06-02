#lang racket

(define (multiple? i j) (= (remainder i j) 0))

(define (multiple?-through check through [results empty])
  (for/and ([each (in-naturals)]
             #:when  (> each 0)
             #:break (= (+ 1 through) each))
    (multiple? check each)))

(define (goal? n) (multiple?-through n 20))

(for ([n (in-naturals)]
      #:break (= n 300000000)
      #:when  (> n 0)
      #:when  (goal? n))
  (displayln n))