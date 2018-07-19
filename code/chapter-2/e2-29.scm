(define (make-mobile left right)
  (list left right))

(define (left-branch m)
  (car m))

(define (right-branch m)
  (car (cdr m)))

(define (make-branch length structure)
  (list length structure))

(define (branch-length b)
  (car b))

(define (branch-structure b)
  (car (cdr b)))

(define (total-weight m)
  (if (pair? m)
    (+ (total-weight (branch-structure (left-branch m)))
       (total-weight (branch-structure (right-branch m))))
    m))

(define (branch-torque branch)
  (* (branch-length branch)
     (total-weight (branch-structure branch))))

(define (blance? m)
  (if (pair? m)
    (and (= (branch-torque (left-branch m)) (branch-torque (right-branch m)))
         (blance? (branch-structure (left-branch m)))
         (blance? (branch-structure (right-branch m))))
    #t))

(define b1 (make-branch 2 3))
(define b2 (make-branch 3 2))
(define m1 (make-mobile b1 b2))
(define b3 (make-branch 1 m1))
(define b4 (make-branch 1 m1))
(define m (make-mobile b3 b4))

(total-weight m)
(blance? m)