(define (adjoin-set x set)
  (if (null? set)
    (list x)
    (let ((current-element (car set))
          (remain-element (cdr set)))
      (cond ((= current-element x) set)
        ((> x current-element)
          (cons current-element (adjoin-set x remain-element)))
        (else (cons x set))))))

(adjoin-set 3 (list 1 2 4 5))