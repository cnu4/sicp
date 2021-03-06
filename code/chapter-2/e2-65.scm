(load "e2-62.scm") ; union-set

; o(n)
(define (tree->list-2 tree)
    (define (copy-to-list tree result-list)
        (if (null? tree)
            result-list
            (copy-to-list (left-branch tree)
                          (cons (entry tree)
                                (copy-to-list (right-branch tree)
                                              result-list)))))
    (copy-to-list tree '()))


; define tree
(define (make-tree entry left right)
    (list entry left right))

(define (entry tree)
    (car tree))

(define (left-branch tree)
    (cadr tree))

(define (right-branch tree)
    (caddr tree))

; o(n)
(define (list->tree elements)
    (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
    (if (= n 0)
        (cons '() elts)
        (let ((left-size (quotient (- n 1) 2)))
            (let ((left-result (partial-tree elts left-size)))
                (let ((left-tree (car left-result))
                      (non-left-elts (cdr left-result))
                      (right-size (- n (+ left-size 1))))
                    (let ((this-entry (car non-left-elts))
                          (right-result (partial-tree (cdr non-left-elts)
                                                      right-size)))
                        (let ((right-tree (car right-result))
                              (remaining-elts (cdr right-result)))
                            (cons (make-tree this-entry left-tree right-tree)
                                  remaining-elts))))))))

(define (union-tree tree1 tree2)
  (list->tree
    (union-set (tree->list-2 tree1) (tree->list-2 tree2))))

(union-tree (list->tree '(1 2 3 4 5))
            (list->tree '(1 3 5 7 9)))
