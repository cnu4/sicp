(load "e3-50.scm")

(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))

(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq (stream-map accum (stream-enumerate-interval 1 20)))
(display-line sum)
(define y (stream-filter even? seq))
(display-line sum)
(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
                         seq))
(display-line sum)
(stream-ref y 7)
(display-line sum)
(display-stream z)
(display-line sum)
