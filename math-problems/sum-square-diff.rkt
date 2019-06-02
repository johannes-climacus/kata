#lang racket

(define (square n) (* n n))

; test
; (= (square 2) 4)

(define (sum-squares through)
  (for/sum ([n (in-range 1 (+ 1 through))]) (square n)))

; test
; (= (sum-squares 10) 385)

(define (square-sum through)
  (square (for/sum ([n (in-range 1 (+ 1 through))]) n)))

; test
; (= (square-sum 10) 3025)

(define (square-sum-difference through)
  (- (square-sum through) (sum-squares through)))

; test
; (= (square-sum-difference 10) 2640)
