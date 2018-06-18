(load "e1-43.scm")

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2)))

(define (expt x n)
  (define (iter x n result)
    (if (= n 0)
      result
      (iter x (- n 1) (* result x))))
  (iter x n 1))

(define (average-damp-n-times f n)
  ((repeated average-damp n) f))

(define (lg n)
  (cond ((> (/ n 2) 1)
          (+ 1 (lg (/ n 2))))
        ((< (/ n 2) 1)
          0)
        (else
          1)))

(define (nth-root x n)
  (let ((damp-times (lg n)))
    (fixed-point (average-damp-n-times (lambda (y) (/ x (expt y (- n 1)))) damp-times) 1.0)))

(nth-root 20 4)
(nth-root 20 8)
(nth-root 20 16)