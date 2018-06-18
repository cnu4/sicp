(load "e1-43.scm")

(define dx 0.00001)

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))

((smooth square) 5)

(define (repeated-smooth n)
  (repeated smooth n))

(((repeated-smooth 10) square) 5)
