(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))

  (define (deposit amount)
    (set! balance (+ balance amount)))

  (define try-times 0)

  (define (verify-password input-password)
    (if (eq? password input-password)
      (begin (set! try-times 0) #t)
      (begin (set! try-times (+ try-times 1))
             (call-cops? try-times)
             #f)))
  
  (define (call-cops? time)
    (if (> time 6)
      (call-cops)))

  (define (call-cops)
    (newline)
    (display "Cops' comming!")
    (newline))

  (define (dispatch input-password m)
    (if (verify-password input-password)
      (cond ((eq? m 'withdraw)
        withdraw)
      ((eq? m 'deposit)
        deposit)
      (else (error "Unknow request -- MAKE-ACCOUNT" m)))
    (lambda (useless-arg) (display "Incorrect password"))))
  dispatch)

(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 40)
((acc 'invalid-password 'deposit) 50)
((acc 'secret-password 'withdraw) 40)
((acc 'invalid-password 'deposit) 50)
((acc 'invalid-password 'deposit) 50)
((acc 'invalid-password 'deposit) 50)
((acc 'invalid-password 'deposit) 50)
((acc 'invalid-password 'deposit) 50)
((acc 'invalid-password 'deposit) 50)
((acc 'invalid-password 'deposit) 50)