(load "e1-22.scm")

(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
    null-value
    (if (filter a)
      (combiner (term a)
                (filtered-accumulate combiner null-value term (next a) next b filter))
      (filtered-accumulate combiner null-value term (next a) next b filter))))

(define (sum-primes a b)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (filtered-accumulate + 0 identity a inc b prime?))

(define (coprime? i n)
  (and (< i n)
       (= 1 (gcd i n))))

(define (product-coprimes-n n)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (define (coprime-helper? i)
    (coprime? i n))
  (filtered-accumulate * 1 identity 1 inc n coprime-helper?))

(sum-primes 2 10) ; 2+3+5+7
(product-coprimes-n 10) ; 2*3*5*7