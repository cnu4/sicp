(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (car x)
  (if (= 0 (remainder x 2))
    (+ 1 (car (/ x 2)))
    0))

(define (cdr x)
  (if (= 0 (remainder x 3))
    (+ 1 (cdr (/ x 3)))
    0))

(cons 2 3)
(car (cons 2 3))
(cdr (cons 2 3))