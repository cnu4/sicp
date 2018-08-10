(load "e2-33.scm")

(define (emumerate-interval n m)
  (if (> n m)
    '()
    (cons n (emumerate-interval (+ n 1) m))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (unique-pairs n)
  (flatmap
    (lambda (i)
      (map (lambda (j) (list i j))
            (emumerate-interval 1 (- i 1))))
    (emumerate-interval 1 n)))

(unique-pairs 6)