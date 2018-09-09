(load "e2-69.scm")
(load "e2-68-define-encode")

(define tree (generate-huffman-tree '((A 1) (NA 16) (BOOM 1) (SHA 3) (GET 2) (YIP 9) (JOB 2) (WAH 1))))

(define msg '(Get a job))

(encode msg tree)
