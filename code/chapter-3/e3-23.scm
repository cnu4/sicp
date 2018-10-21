(define (front-ptr deque)
  (car deque))

(define (rear-ptr deque)
  (cdr deque))

(define (set-front-ptr! deque item)
  (set-car! deque item))

(define (set-rear-ptr! deque item)
  (set-cdr! deque item))

(define (empty-deque? deque)
  (or
    (null? (front-ptr deque))
    (null? (rear-ptr deque))))

(define (make-deque)
  (cons '() '()))

(define (front-deque deque)
  (if (empty-deque? deque)
    (error "FRONT called with an empty deque")
    (car (front-ptr deque))))

(define (rear-deque deque)
  (if (empty-deque? deque)
    (error "REAR called with an empty deque")
    (car (rear-ptr deque))))

(define (rear-insert-deque! deque item)
  (let ((new-pair (cons item '())))
    (cond ((empty-deque? deque)
          (set-front-ptr! deque new-pair)
          (set-rear-ptr! deque new-pair)
          (front-ptr deque))
      (else
        (set-cdr! (rear-ptr deque) new-pair)
        (set-rear-ptr! deque new-pair)
        (front-ptr deque)))))

(define (front-insert-deque! deque item)
  (let ((new-pair (cons item '())))
    (cond ((empty-deque? deque)
          (set-front-ptr! deque new-pair)
          (set-rear-ptr! deque new-pair)
          (front-ptr deque))
      (else
        (set-cdr! new-pair (front-ptr deque))
        (set-front-ptr! deque new-pair)
        (front-ptr deque)))))

(define (front-delete-deque! deque)
  (cond ((empty-deque? deque)
        (error "DELETE called with an empty deque"))
    (else
      (set-front-ptr! deque (cdr (front-ptr deque)))
      (front-deque deque))))

(define (rear-delete-deque! deque) ; TODO O(n) here
  (define (iter deque front)
    (cond ((null? (cdr (cdr front)))
          (set-cdr! front '())
          (set-rear-ptr! deque front)
          (front-deque deque))
      (else
        (iter deque (cdr front)))))
  (cond ((empty-deque? deque)
        (error "DELETE called with an empty deque"))
    ((null? (cdr (front-ptr deque)))
      (set-front-ptr! deque '())
      (front-deque deque))
    (else
      (iter deque (front-ptr deque)))))

(define (print-deque q)
  (car q))

(define q1 (make-deque))
(front-insert-deque! q1 'a)
(front-insert-deque! q1 'b)
(front-insert-deque! q1 'c)
(rear-delete-deque! q1)
(print-deque q1)
(front-delete-deque! q1)
(print-deque q1)
(front-delete-deque! q1)
