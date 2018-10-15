(define f
  (lambda (first-arg)
    (set! f (lambda (second-value) 0))
    first-arg))

(+ (f 0) (f 1))
(+ (f 1) (f 0))