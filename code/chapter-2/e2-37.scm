(load "e2-36.scm")

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (mi) (dot-product mi v)) m))

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row-of-m)
            (matrix-*-vector cols row-of-m))
          m)))

(define v (list 1 2 3 4))
(define w (list 4 5 6 6))
(define mat (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))

(dot-product v w)
(matrix-*-vector mat v)
(transpose mat)
(matrix-*-matrix mat (transpose mat))