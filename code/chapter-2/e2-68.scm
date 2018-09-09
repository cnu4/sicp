(load "e2-67-define-huffman.scm")
(load "e2-68-define-encode")

(define sample-tree (make-code-tree (make-leaf 'A 4)
  (make-code-tree (make-leaf 'B 2)
                  (make-code-tree (make-leaf 'D 1)
                                  (make-leaf 'C 1)))))

(define sample-message '(a d a b b c a))

(encode sample-message sample-tree)