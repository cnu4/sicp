(load "e2-56.scm")

(define (augend a)
  (if (null? (cdddr a))
    (caddr a)
    (cons '+ (cddr a))))

(define (multiplicand p)
  (if (null? (cdddr p))
    (caddr p)
    (cons '* (cddr p))))

(deriv '(* x y (+ x 3)) 'x)