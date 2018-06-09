(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b counter product)
  (cond ((= counter 0) product)
    ((event? counter) (fast-expt-iter (* b b) (/ counter 2) product))
    (else (fast-expt-iter b (- counter 1) (* b product)))))

(define (event? n)
  (= (remainder n 2) 0))

(fast-expt 2 10)  
(fast-expt 2 7)