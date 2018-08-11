(load "e2-40.scm")

(define (adjoin-position new-row k rest-of-queens)
  (if (null? rest-of-queens)
    (cons new-row '())
    (cons (car rest-of-queens) (adjoin-position new-row k (cdr rest-of-queens)))))

(define (safe? k positions)
  (define (get-value-of-k k i rest)
    (if (= k i)
      (car rest)
      (get-value-of-k k (+ i 1) (cdr rest))))
  (define (iter k i rest k-value)
    (if (= k i)
      #t
      (let ((offset (- k i)))
        (and (not (= k-value (car rest)))
            (not (= (car rest) (+ k-value offset)))
            (not (= (car rest) (- k-value offset)))
            (iter k (+ i 1) (cdr rest) k-value)))))
  (iter k 1 positions (get-value-of-k k 1 positions)))

(define empty-board '())

(define (queens board-size)
  (define (queens-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                    (adjoin-position new-row k rest-of-queens))
                 (emumerate-interval 1 board-size)))
          (queens-cols (- k 1))))))
  (queens-cols board-size))

(adjoin-position 1 2 (list 2 6))
(safe? 3 (list 3 7 4))
(queens 8)