(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate combiner null-value term (next a) next b))))
              
(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (sum-intergers a b)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (sum identity a inc b))

(sum-intergers 1 10)