(load "e2-38.scm")

(define (reverse-1 sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))

(define (reverse-2 sequence)
  (fold-right (lambda (x y) (append y (list x))) '() sequence))

(reverse-1 (list 1 2 3 4))
(reverse-2 (list 1 2 3 4))