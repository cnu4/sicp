(define (mutiple a b)
  (mutiple-iter a b 0))

(define (mutiple-iter a counter result)
  (cond ((= counter 0) result)
    ((even? counter) (mutiple-iter (double a) (halve counter) result))
    (else (mutiple-iter a (- counter 1) (+ result a)))))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(mutiple 1 2)
(mutiple 8 9)