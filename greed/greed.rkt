#lang racket

(define (score rolls)
  (define (rule face single double triple quadruple quintuple)
    (match (length (filter (lambda (n) (= n face)) rolls))
      [1 single]
      [2 double]
      [3 triple]
      [4 quadruple]
      [5 quintuple]
      [_ 0]))
  (apply + (list (rule 1 100 200 1000 1100 1200)
                 (rule 2   0   0  200    0    0)
                 (rule 3   0   0  300    0    0)
                 (rule 4   0   0  400    0    0)
                 (rule 5  50 100  500  550  600)
                 (rule 6   0   0  600    0    0))))

(displayln
 (if (and (= (score '(1 1 1 5 1)) 1150)
          (= (score '(2 3 4 6 2))    0)
          (= (score '(3 4 5 3 3))  350)
          (= (score '(1 5 1 2 4))  250)
          (= (score '(5 5 5 5 5))  600))
     "Tests passed"
     "Tests failed"))
