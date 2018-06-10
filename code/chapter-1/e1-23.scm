(load "e1-22.scm")

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (next test-divisor)))))

(define (next n)
  (if (even? n)
    (+ n 1)
    (+ n 2)))

(search-for-prime 1000000)
(search-for-prime 10000000)
(search-for-prime 100000000)