(load "e2-2.scm")

(define (perimeter-rectangle r)
  (let ((length (length-of-rectangle r))
       (width (width-of-rectangle r)))
    (* 2 (+ length width))))

(define (area-rectangle r)
  (* (length-of-rectangle r)
     (width-of-rectangle r)))

(define (make-rectangle length width)
  (cons length width))

(define (length-rectangle r)
  (car r))

(define (width-rectangle r)
  (cdr r))

(define (length-of-rectangle r)
  (let ((start (start-segment (length-rectangle r)))
        (end (end-segment (length-rectangle r))))
    (- (x-point end)
       (x-point start))))

(define (width-of-rectangle r)
  (let ((start (start-segment (width-rectangle r)))
        (end (end-segment (width-rectangle r))))
    (- (y-point end)
       (y-point start))))

(define l (make-segment (make-point 1 1) (make-point 5 1)))
(define w (make-segment (make-point 1 1) (make-point 1 3)))
(define r (make-rectangle l w))

(length-of-rectangle r)
(width-of-rectangle r)
(perimeter-rectangle r)
(area-rectangle r)
