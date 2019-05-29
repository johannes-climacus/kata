(defn score [rolls]
  (defn tally [face matches points]
    (defn rule [one five default]
      (fn f [face]
        (cond (= face 1) one
              (= face 5) five
              :else      (default face))))
    (let [triple (rule 1000 500 (fn [n] (* 100 n)))
          single (rule 100  50  (fn [n] 0 ))]
      (loop [f face m matches p points]
        (if (zero? m) p
          (if (>= m 3)
            (recur f (- m 3) (+ p (triple f)))
            (recur f (- m 1) (+ p (single f))))))))
  (apply + (for [[face matches] (frequencies rolls)]
    (tally face matches 0))))

(defn test-case [input expected]
  (if (= (score input) expected) true false))

(prn (if (and (test-case '(1 2 3 4 5) 150)
              (test-case '(2 3 4 6 2)   0)
              (test-case '(3 4 5 3 3) 350)
              (test-case '(1 5 1 2 4) 250)
              (test-case '(5 5 5 5 5) 600))
  "Tests passed."
  "Tests failed."))

