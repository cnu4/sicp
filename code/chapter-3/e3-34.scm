(load "e3-33-define-constraint-system.scm")

(define (squarer a b)
  (multiplier a a b))

(define a (make-connector))
(define b (make-connector))
(squarer a b)
(probe "a" a)
(probe "b" b)
(set-value! b 2 'user) ; won't get value of a