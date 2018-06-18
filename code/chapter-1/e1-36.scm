(load "e1-35.scm")

(fixed-point 
  (lambda (x)
    (let ((value (+ 1 (/ 1 x))))
      (newline)
      (display value)
      value))
  1.0)

(fixed-point 
  (lambda (x)
    (let ((value (/ (log 1000) (log x))))
      (newline)
      (display value)
      value))
  1.1)

(fixed-point 
  (lambda (x)
    (let ((value (* 0.5 (+ x (/ (log 1000) (log x))))))
      (newline)
      (display value)
      value))
  1.1)