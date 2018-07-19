(load "e2-29.scm")

(define (make-mobile left right)
  (cons left right))

(define (left-branch m)
  (car m))

(define (right-branch m)
  (cdr m))

(define (make-branch length structure)
  (cons length structure))

(define (branch-length b)
  (car b))

(define (branch-structure b)
  (cdr b))

(define b1 (make-branch 2 3))
(define b2 (make-branch 3 2))
(define m1 (make-mobile b1 b2))
(define b3 (make-branch 1 m1))
(define b4 (make-branch 1 m1))
(define m (make-mobile b3 b4))

(total-weight m)
(blance? m)