; same as book
; O(n)
(define (element-of-set? x set)
  (cond ((null? set) false)
    ((equal? x (car set)) true)
    (else (element-of-set? x (cdr set)))))

; O(1)
(define (adjoin-set x set)
  (cons x set))

; O(n^2)
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
    ((element-of-set? (car set1) set2)
    (cons (car set1)
          (intersection-set (cdr set1) set2)))
    (else (intersection-set (cdr set1) set2))))

; O(n)
(define (union-set set1 set2)
  (cond ((null? set1) set2)
    ((null? set2) set1)
    (else (cons (car set1) (union-set (cdr set1) set2)))))

(element-of-set? 2 (list 1 2))
(adjoin-set 2 (list 1 2 3 4))
(intersection-set (list 1 2 3) (list 2 3 4))
(union-set (list 1 2 3) (list 2 3 4))