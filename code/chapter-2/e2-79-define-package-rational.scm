(define (install-rational-package)
  (define (equ x y)
    (= (* (number x) (denom y))
       (* (number y) (demon x))))
       
  (put 'equ '(rational rational)
    (equ x y)))