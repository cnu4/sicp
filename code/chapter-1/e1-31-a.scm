(define (product term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

(define (factorial n)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (product identity 1 inc n))

(factorial 10)

(define (pi n)
  (define (term x)
    (if (odd? x)
      (/ (- x 1) x)
      (/ x (- x 1))))
  (define (next x)
    (+ x 1))
  (* 4.0 (product term 3 next n)))

(pi 1000)
(pi 10000)