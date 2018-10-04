(load "e2-73-define-get-put.scm")
(load "e2-78-define-apply.scm")
(load "e2-78-define-package-number.scm")

(define (attach-tag type-tag contents)
  (if (number? contents)
    contents
    (cons type-tag contents)))

(define (type-tag datum)
  (cond ((number? datum) 'scheme-number)
    ((pair? datum) (car datum))
    (else (error "Bad tagged datum -- TYPE-TAG" datum))))

(define (contents datum)
  (cond ((number? datum) datum)
    ((pair? datum) (cdr datum))
    (else (error "Bad tagged datum -- CONTENTS" datum))))

(define n1 (attach-tag 'scheme-number 2))
(type-tag n1)
(contents n1)
(define r1 (attach-tag 'rectangular (cons 3 4)))
(type-tag r1)
(contents r1)

(install-scheme-number-package)

(define n2 (make-scheme-number 5))
(contents n2)
(add n2 n2)
(div n2 n2)