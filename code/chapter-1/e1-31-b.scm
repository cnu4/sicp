(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))

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