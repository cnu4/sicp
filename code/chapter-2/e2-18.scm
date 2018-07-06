(define (reverse l)
  (iter l '()))

(define (iter l result)
  (if (null? l)
    result
    (iter (cdr l) (cons (car l) result))))

(reverse (list 1 2 3 4))