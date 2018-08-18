(define (top-split painter n)
  (if (= n 0)
    painter
    (let ((smaller (top-split painter (- n 1))))
      (below painter (beside smaller smaller)))))