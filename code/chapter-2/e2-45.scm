(define (split op1 op2)
  (define (split-inter painter n)
    (if (= n 0)
      painter
      (let ((smaller (split-inter painter (- n 1))))
        (op1 painter (op2 smaller smaller)))))
  split-inter)