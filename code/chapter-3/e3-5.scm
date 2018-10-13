(define (monter-carlo trials experiment) ; code from book
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0) (/ trials-passed trials))
      ((experiment)
        (iter (- trials-remaining 1) (+ trials-passed 1)))
      (else 
        (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (estimate-intergral x1 x2 y1 y2 trials)
  (let ((area-rec (* (abs (- x1 x2)) (abs (- y1 y2))))
        (probability (monter-carlo trials (lambda () (experiment x1 x2 y1 y2))))
        (r (/ (abs (- x1 x2)) 2)))
    (exact->inexact
      (/ (* area-rec probability) (* r r)))))

(define (experiment x1 x2 y1 y2)
  (let ((x3 (/ (+ x1 x2) 2))
        (y3 (/ (+ y1 y2) 2)) ; the centre of the circle
        (r (/ (abs (- x1 x2)) 2)) ; the radius of the circle
        (x4 (random-in-range x1 x2))
        (y4 (random-in-range y1 y2))) ; random spot in area
    (not (> (+ (* (- x4 x3) (- x4 x3))
               (* (- y4 y3) (- y4 y3)))
            (* r r)))))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random (exact->inexact range)))))

(estimate-intergral 2 8 4 10 1000)
(estimate-intergral 2 8 4 10 10000)
(estimate-intergral 2 8 4 10 100000)