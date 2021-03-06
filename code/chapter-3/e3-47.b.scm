(define (make-semaphore n)
  (define (acquire)
    (if (test-and-set! n)
      (acquire)
      'ok))
  (define (release)
    (set! n (+ n 1))
    'ok)
  (define (dispatch mode)
    (cond ((eq? mode 'acquire)
            (acquire))
      ((eq? mode 'release)
            (release))
      (else
        error "Unkown mode MAKE-SEMAPHORE" mode)))
  dispatch)

(define (test-and-set! n)
  (if (= n 0)
    #t
    (begine (set! n (- n 1))
            #f)))