(load "e2-73-define-get-put.scm")
(load "e2-78-define-apply.scm")
(load "e2-79-define-package-number.scm")
(load "e2-78-define-tag.scm")

(install-scheme-number-package)

(define n1 (make-scheme-number 5))
(define n2 (make-scheme-number 4))
(define n3 (make-scheme-number 5))
(equ n1 n2)
(equ n1 n3)