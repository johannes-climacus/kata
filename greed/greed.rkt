#lang racket
  
(define (score rolls [total 0])
  (define (tally face rolls)
    (length (filter (lambda (n) (= n face)) rolls)))
  (define-syntax-rule (rule matches face points)
    (when (= matches (tally face rolls))
      (set! total (+ total points))))
  (rule 1 1  100)
  (rule 1 5   50)
  (rule 2 1  200)
  (rule 2 5  100)
  (rule 3 1 1000)
  (rule 3 2  200)
  (rule 3 3  300)
  (rule 3 4  400)
  (rule 3 5  500)
  (rule 3 6  600)
  (rule 4 1 1100)
  (rule 4 5  550)
  (rule 5 1 1200)
  (rule 5 5  600)
  (rule 6 1 2000)
  (rule 6 2  400)
  (rule 6 3  600)
  (rule 6 4  800)
  (rule 6 5 1000)
  (rule 6 6 1200)
  total)

(define (play)
  (define (rolls n [l empty])
    (define (roll) (+ (random 6) 1))
    (if (zero? n)
        l
        (begin
          (set! l (cons (roll) l))
          (rolls (- n 1) l))))
  (define luck (rolls 5))
  (displayln (format "Rolled: ~a" luck))
  (displayln (format "Scored: ~a" (score luck))))


(displayln
 (if (and
      (= (score '(1 1 1 5 1)) 1150)
      (= (score '(2 3 4 6 2))    0)
      (= (score '(3 4 5 3 3))  350)
      (= (score '(1 5 1 2 4))  250)
      (= (score '(5 5 5 5 5))  600))
     "Tests passed"
     "Tests failed"))

(displayln "To play a round of Greed, type (play) & hit enter.")
