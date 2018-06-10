(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (real-time-clock)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (real-time-clock) start-time))
    false))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  true)
  
(define (even? num)
  (= (remainder num 2) 0))

(define (search-for-prime-iter n counter)
  (if (< counter 3)
    (if (timed-prime-test n)
      (search-for-prime-iter (+ n 2) (+ counter 1))
      (search-for-prime-iter (+ n 2) counter))))

(define (search-for-prime n)
  (if (even? n)
    (search-for-prime-iter (+ n 1) 0)
    (search-for-prime-iter n 0)))

(search-for-prime 1000000)
(search-for-prime 10000000)
(search-for-prime 100000000)