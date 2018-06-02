(define (sum-of-squares a b)
  (+ (* a a) (* b b)))

(define (bigger-sum-of-squares a b c)
  (cond
    ((and (> a b) (> b c)) (sum-of-squares a b))
    ((and (> a b) (> c b)) (sum-of-squares a c))
    ((and (> b a) (> a c)) (sum-of-squares a b))
    ((and (> b a) (> c a)) (sum-of-squares b c))))

(bigger-sum-of-squares 1 2 3)
(bigger-sum-of-squares 1 3 3)
(bigger-sum-of-squares 3 2 1)
