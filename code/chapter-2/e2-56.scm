(load "e2-56-define-deriv.scm")

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base e)
  (cadr e))

(define (exponent e)
  (caddr e))

(define (make-exponentation base exponent)
  (cond ((=number? exponent 0) 1)
    ((=number? exponent 1) base)
    (else (list '** base exponent))))

(define (deriv exp var)
  (cond ((number? exp)
          0)
        ((variable? exp)
          (if (same-variable? exp var)
              1
              0))
        ((sum? exp)
          (make-sum (deriv (addend exp) var)
                    (deriv (augend exp) var)))
        ((product? exp)
          (make-sum
              (make-product (multiplier exp)
                            (deriv (multiplicand exp) var))
              (make-product (deriv (multiplier exp) var)
                            (multiplicand exp))))
        ((exponentiation? exp) ;make-exponentation
          (make-product
            (exponent exp)
              (make-product
                (make-exponentation
                  (base exp)
                  (- (exponent exp) 1))
                (deriv (base exp) var))))
        (else
          (error "unknown expression type -- DERIV" exp))))

(deriv '(** x 0) 'x)
(deriv '(** x 1) 'x)
(deriv '(** x 2) 'x)
(deriv '(** x 3) 'x)