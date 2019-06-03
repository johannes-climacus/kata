#lang racket

(define (square x) (* x x))
(define (rightTriangle? a b c) (= (+ (square a) (square b)) (square c)))
(define (pythagoreanTriplet? a b c) (and (< a b c) (rightTriangle? a b c)))

(define (search-for-pt sum limit)
  (for*/list ([a (in-range limit)]
              [b (in-range limit)]
              [c (in-range limit)]
              #:when (and (pythagoreanTriplet? a b c)
                          (= (+ a b c) sum)))
    (list a b c)))

(apply * (car (search-for-pt 1000 500)))
