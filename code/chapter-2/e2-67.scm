(load "e2-67-define-huffman.scm")

(define sample-tree (make-code-tree (make-leaf 'A 4)
  (make-code-tree (make-leaf 'B 2)
                  (make-code-tree (make-leaf 'D 1)
                                  (make-leaf 'C 1)))))

(define sample-msg '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(decode sample-msg sample-tree)