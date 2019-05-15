#lang racket

(define (score rolls)
  (define (tally face rolls)
    (length (filter (lambda (n) (= n face)) rolls)))
  (define (rule matches face points)
    (if (= matches (tally face rolls)) points 0))
  (apply + (list (rule 1 1  100)
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
                 (rule 5 5  600))))

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
