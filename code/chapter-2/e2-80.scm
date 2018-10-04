(load "e2-73-define-get-put.scm")
(load "e2-78-define-apply.scm")
(load "e2-80-define-package-number.scm")
(load "e2-78-define-tag.scm")

(install-scheme-number-package)

(define n1 (make-scheme-number 0))
(define n2 (make-scheme-number 4))
(zero? n1)
(zero? n2)