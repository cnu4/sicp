(define (make-rat n d)
  (if (< d 0)
    (cons (- n) (- d))
    (cons n d)))

(define (number x)
  (car x))

(define (demon x)
  (cdr x))

(define (print-rat x)
  (newline)
  (display (number x))
  (display "/")
  (display (demon x)))

(print-rat (make-rat 1 2))
(print-rat (make-rat -1 -2))
(print-rat (make-rat -1 2))
(print-rat (make-rat 1 -2))