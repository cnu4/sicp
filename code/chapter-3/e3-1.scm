(define (make-accumulator init)
  (lambda (num)
    (begin (set! init (+ init num))
           init)))

(define A (make-accumulator 20))
(A 5)
(A 10)