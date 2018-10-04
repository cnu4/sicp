(define (install-complex-package)
  (define (equ x y)
    (and (= (real-part x) (real-part y))
         (= (imag-part x) (imag-part y))))
  
  (put 'equ '(complex complex)
    (equ x y)))