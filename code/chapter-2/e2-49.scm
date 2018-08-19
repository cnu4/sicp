(load "e2-48.scm")

(define top-left (make-vect 0 1))
(define top-right (make-vect 1 1))
(define bottom-left (make-vect 0 0))
(define bottom-right (make-vect 1 0))

(define top-mid-point (make-vect 0.5 1.0))
(define bottom-mid-point (make-vect 0.5 0.0))
(define left-mid-point (make-vect 0.0 0.5))
(define right-mid-point (make-vect 1.0 0.5))

(define border-painter
  (segment->painter (make-segment bottom-left top-left)
                    (make-segment top-left top-right)
                    (make-segment top-right bottom-right)
                    (make-segment bottom-right bottom-left)))

(define x-painter
  (segment->painter (make-segment top-left bottom-right)
                    (make-segment top-right bottom-left)))
                    
(define diamond-painter
  (segment->painter (make-segment top-mid-point right-mid-point)
                    (make-segment right-mid-point bottom-mid-point)
                    (make-segment bottom-mid-point left-mid-point)
                    (make-segment left-mid-point top-mid-point)))
