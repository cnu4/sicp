(load "e1-35.scm")

(define (deriv g)
  (lambda (x) 
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define dx 0.00001)

(define (newton-transform g)
  (lambda (x) 
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  (lambda (x) (+ (cube x)
                 (* a (square x))
                 (* b x)
                 c)))

(define (cube x)
  (* x x x))

((lambda (a b c) 
  (newtons-method (cubic a b c) 1.0)) 3 2 1)
