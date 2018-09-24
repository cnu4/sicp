(load "e2-73-b.scm")

(define (install-deriv)
  (define (addend s)
      (car s))
  (define (augend s)
      (cadr s))
  (define (make-sum a1 a2)
    (cond ((=number? a1 0)
            a2)
          ((=number? a2 0)
            a1)
          ((and (number? a1) (number? a2))
            (+ a1 a2))
          (else
            (list '+ a1 a2))))

  (define (multiplier p)
    (car p))
  (define (multiplicand p)
    (cadr p))
  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0))
            0)
          ((=number? m1 1)
            m2)
          ((=number? m2 1)
            m1)
          ((and (number? m1) (number? m2))
            (* m1 m2))
          (else
            (list '* m1 m2))))

  (define (base e)
    (car e))
  (define (exponent e)
    (cadr e))
  (define (make-exponentation base exponent)
    (cond ((=number? exponent 0) 1)
      ((=number? exponent 1) base)
      (else (list '** base exponent))))

  (put 'deriv '+
    (lambda (exp var)
      (make-sum (deriv (addend exp) var)
                (deriv (augend exp) var))))
  (put 'deriv '*
    (lambda (exp var)
      (make-product (multiplier exp)
                    (deriv (multiplicand exp) var))
      (make-product (deriv (multiplier exp) var)
                    (multiplicand exp))))

  (put 'deriv '**
    (lambda (exp var)
      (make-product
        (exponent exp)
          (make-product
            (make-exponentation
              (base exp)
              (- (exponent exp) 1))
            (deriv (base exp) var)))))
  'done)

(install-deriv)
(deriv '(** x 0) 'x)
(deriv '(** x 1) 'x)
(deriv '(** x 2) 'x)
(deriv '(** x 3) 'x)