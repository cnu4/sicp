(load "e2-48.scm")

(define top-left (make-vect 0 1))
(define top-right (make-vect 1 1))
(define bottom-left (make-vect 0 0))
(define bottom-right (make-vect 1 0))

(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect bottom-right)
                     (make-vect bottom-left)
                     (make-vect top-right))

(define (rotate180 painter)
  (transform-painter painter
                     (make-vect top-right)
                     (make-vect top-left)
                     (make-vect bottom-right))

(define (rotate270 painter)
  (transform-painter painter
                     (make-vect top-left)
                     (make-vect bottom-left)
                     (make-vect top-right))