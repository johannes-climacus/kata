#lang racket
; get ~> pipeline operator
(require threading)

; any -> int or string
(define (convert-numerals input)
  ; int -> int list -> list -> string
  (define (arabic->roman i [values '(1000 500 100 50 10 5 1)] [l empty])
    ; int -> int -> list -> int -> int list
    (define (tally i j [l empty] [k (quotient i j)])
      (if (zero? k) l (tally i j (cons j l) (- k 1))))
    ; int -> char
    (define (numeralize i)
      (match i
        [1000 #\M]
        [500  #\D]
        [100  #\C]
        [50   #\L]
        [10   #\X]
        [5    #\V]
        [1    #\I]))
    ; int list -> string
    (define (stringify values)
      (list->string (map numeralize values)))
    ; string -> string
    (define (substitute numerals)
      (~> numerals
          (string-replace "DCCCC" "CM")
          (string-replace "CCCC"  "CD")
          (string-replace "LXXXX" "XC")
          (string-replace "XXXX"  "XL")
          (string-replace "VIIII" "IX")
          (string-replace "IIII"  "IV")))
    (if (empty? values) (~> l reverse stringify substitute)
        (if (not (= i (modulo i (first values))))
            (arabic->roman (modulo i (first values))
                           (rest values)
                           (tally i (first values) l))
            (arabic->roman i (rest values) l))))

  ; string -> int
  (define (roman->arabic s)
    ; string -> string
    (define (substitute numerals)
      (~> numerals
          (string-replace "CM" "DCCCC")
          (string-replace "CD" "CCCC")
          (string-replace "XC" "LXXXX")
          (string-replace "XL" "XXXX")
          (string-replace "IX" "VIIII")
          (string-replace "IV" "IIII")))
    ; char -> int
    (define (digitize c)
      (match c
        [#\M 1000]
        [#\D 500]
        [#\C 100]
        [#\L 50]
        [#\X 10]
        [#\V 5]
        [#\I 1]))
    (apply + (map digitize (~> s substitute string->list))))

  (cond [(integer? input) (arabic->roman input)]
        [(string?  input) (roman->arabic input)]
        [else (error "Error: Invalid input.")]))

; int or string -> bool
(define (test input expected)
  (define output (convert-numerals input))
  (cond [(integer? expected) (eq? output expected)]
        [(string? expected) (string=? output expected)]))

(displayln
 (if (and (test 1222       "MCCXXII")
          (test 1664       "MDCLXIV")
          (test 1999       "MCMXCIX")
          (test 3108       "MMMCVIII")
          (test 4092       "MMMMXCII")
          (test "LXX"      70)
          (test "XLIX"     49)
          (test "CMXXI"    921)
          (test "MMXLVIII" 2048))
     "Tests passed."
     "Tests failed."))
