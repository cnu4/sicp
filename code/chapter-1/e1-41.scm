(define (double f)
  (lambda (x)
    (f (f x))))

(define (inc x)
  (+ x 1))

((double inc) 1)
((double square) 2)

(((double (double double)) inc) 5)