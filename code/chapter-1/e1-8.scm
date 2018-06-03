(load "e1-7.scm")

(define (imporve-cube guess x)
  (/ (+ (/ x (* guess guess))
        (* 2 guess))
     3))

(define (cube-root-iter guess x)
  (if (new-good-enough? guess (imporve-cube guess x))
    (imporve-cube guess x)
    (cube-root-iter (imporve-cube guess x) x)))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root (* 3 3 3))
(cube-root (* 0.2 0.2 0.2))