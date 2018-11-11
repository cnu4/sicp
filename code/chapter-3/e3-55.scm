(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define ones (cons-stream 1 ones))
(define integers (cons-stream 1 (add-streams ones integers)))

(define (partial-sums s) ; new
  (cons-stream (car s) (add-streams (stream-cdr s) (partial-sums s))))

(stream-head (partial-sums integers) 10)