(load "e1-37-b.scm")

(define (get-e k)
  (+ (cont-frac (lambda (i) 1.0)
        (lambda (i)
          (if (= (remainder (- i 2) 3) 0)
            (* 2 (+ (/ (- i 2) 3) 1))
            1))
        k)
     2))

(get-e 100)
