(define (accumulate combinder null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combinder result (term a)))))
  (iter a null-value))

(define (product term a next b)
  (accumulate * 1 term a next b))

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