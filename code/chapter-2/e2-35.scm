(load "e2-33.scm")

(define (count-leaves t)
  (accumulate + 0 (map (lambda (sub-tree)
                          (if (pair? sub-tree)
                            (count-leaves sub-tree)
                            1))
                        t)))

(define tree (list (list 1 2) (list 3 4)))
(count-leaves tree)                        