(define (mutiple a b)
  (cond ((= b 0) 0)
    ((even? b) (mutiple (double a) (halve b)))
    (else (+ (mutiple a (- b 1)) a))))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(mutiple 1 2)
(mutiple 8 9)