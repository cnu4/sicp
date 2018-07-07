(define (for-each proc items)
  (if (not (null? items))
    (begin (proc (car items)) (map proc (cdr items)))))

(for-each (lambda (x) (newline) (display x))
          (list 1 2 3 4))