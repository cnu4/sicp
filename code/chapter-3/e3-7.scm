(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (verify-password input-password)
    (eq? password input-password))

  (define (dispatch input-password m)
    (if (verify-password input-password)
      (cond ((eq? m 'withdraw)
        withdraw)
      ((eq? m 'deposit)
        deposit)
      ((eq? m 'verify-password) ; new action
        verify-password)
      (else (error "Unknow request -- MAKE-ACCOUNT" m)))
    (lambda (useless-arg) (display "Incorrect password"))))
  dispatch)

(define (make-joint acc acc-password new-password) ;new method
  (define (dispatch input-password m)
    (if (eq? input-password new-password)
      (acc acc-password m)
    (lambda (useless-arg) (display "Incorrect password"))))
  (if ((acc acc-password 'verify-password) acc-password)
    dispatch))

(define acc (make-account 100 'secret-password))
(define acc2 (make-joint acc 'secret-password 'my-password))
((acc 'secret-password 'withdraw) 40)
((acc2 'my-password 'deposit) 50)
((acc2 'secret-password 'deposit) 50)