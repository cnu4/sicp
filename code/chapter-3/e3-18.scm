(define (loop? l)
  (define identity (cons '() '()))
  (define (loop-iter rest-list)
    (cond ((null? rest-list) #f)
      ((eq? identity (car rest-list)) #t)
      (else
        (set-car! rest-list identity)
        (loop-iter (cdr rest-list)))))
  (loop-iter l))

(loop? (list 1 2 3 4))

(define loop (list 'a 'b 'c))
(set-cdr! (last-pair loop) loop)
(loop? loop)