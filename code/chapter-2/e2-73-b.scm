(load "e2-73-define-get-put.scm")

(define (deriv exp var)
  (cond ((number? exp) 0)
    ((variable? exp) (if (same-variable? exp var) 1 0))
    (else ((get 'deriv (operator exp)) (operands exp)
                                       var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

;; number

(define (=number? exp num)
    (and (number? exp)
         (= exp num)))

;; variable

(define (variable? x)
    (symbol? x))

(define (same-variable? v1 v2)
    (and (variable? v1)
         (variable? v2)
         (eq? v1 v2)))

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
  'done)

(install-deriv)
(deriv '(+ x 3) 'x)
(deriv '(* x y) 'x)
