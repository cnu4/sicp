(load "e1-37-b.scm")

(define (tan-cont-frac x k)
  (cont-frac (lambda (i)
        (if (= i 1)
          x
          (* -1 x x)))
      (lambda (i)
        (- (* i 2) 1))
      k))

(tan 10.0)
(tan-cont-frac 10.0 100)