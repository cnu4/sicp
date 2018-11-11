(load "e3-50-define-enumerate.scm")

(define (stream-map proc . argstreams)
  (if (null? (car argstreams))
    '()
    (cons-stream
      (apply proc (map stream-car argstreams))
      (apply stream-map
             (cons proc (map stream-cdr argstreams))))))

(define one-to-five (stream-enumerate-interval 1 5))
(define sm (stream-map + one-to-five one-to-five))
(stream-car sm)
(stream-car (stream-cdr sm))