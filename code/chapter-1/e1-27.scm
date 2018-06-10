(define (expmod base exp m)
  (cond ((= exp 0) 1)
    ((even? exp) 
      (remainder (square (expmod base (/ exp 2) m))
                 m))
    (else
      (remainder (* base (expmod base (- exp 1) m))
                 m))))

                 
(define (is-carmichael-iter n a)
  (cond ((< a 1) true)
    ((= (expmod a n n) a) (is-carmichael-iter n (- a 1)))
    (else false)))

(define (is-carmichael n)
  (is-carmichael-iter n (- n 1)))

(is-carmichael 561)
(is-carmichael 1105)
(is-carmichael 1729)
(is-carmichael 2465)
(is-carmichael 2821)
(is-carmichael 6601)