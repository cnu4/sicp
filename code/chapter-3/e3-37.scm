(load "e3-33-define-constraint-system.scm")

(define (c+ x y)
  (let ((z (make-connector)))
    (adder x y z)
    z))

(define (c* x y)
  (let ((z (make-connector)))
    (multiplier x y z)
    z))

(define (c/ x y)
  (let ((z (make-connector)))
    (multiplier z y x)
    z))

(define (cv c)
  (let ((z (make-connector)))
    (constant c z)
    z))

(define (celsius-fahrenheit-converter x)
  (c+ (c* (c/ (cv 9) (cv 5))
          x)
      (cv 32)))

(define C (make-connector))
(define F (celsius-fahrenheit-converter C))

(probe "C temp" C)
(probe "F temp" F)
(set-value! C 25 'user)
(forget-value! C 'user)
(set-value! F 212 'user)