(load "e1-22.scm")

(define (prime? n)
  (fast-prime? n 10))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
    ((even? exp) 
      (remainder (square (expmod base (/ exp 2) m))
                 m))
    (else
      (remainder (* base (expmod base (- exp 1) m))
                 m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
    ((fermat-test n) (fast-prime? n (- times 1)))
    (else false)))

(search-for-prime 1000000)
(search-for-prime 10000000)
(search-for-prime 100000000)