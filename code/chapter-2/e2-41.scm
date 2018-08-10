(load "e2-40.scm")

(define (unique-triple n)
  (flatmap
    (lambda (i)
      (map (lambda (j)
              (cons i j))
            (unique-pairs (- i 1))))
    (emumerate-interval 1 n)))

(define (equals-to-s? l s)
  (= (accumulate + 0 l) s))

(define (sum-triple-s n s)
  (filter (lambda (l) (equals-to-s? l s)) (unique-triple n)))

(unique-triple 5)
(sum-triple-s 5 8)