(define (same-parity first . l)
  (let ((filter? (if (even? first)
    even?
    odd?)))
    (define (iter rest)
      (cond ((null? rest) '())
        ((filter? (car rest))
          (cons (car rest) (iter (cdr rest))))
        (else
          (iter (cdr rest)))))
    (cons first (iter l))))


(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)