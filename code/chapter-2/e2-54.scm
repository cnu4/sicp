(define (equal? x y)
    (cond ((and (symbol? x) (symbol? y))
            (symbol-equal? x y))
          ((and (pair? x) (pair? y))
            (and (equal? (car x) (car y)) (equal? (cdr x) (cdr y))))
          ((and (null? x) (null? y))
            #t)
          (else
            #f)))

(define (symbol-equal? x y)
    (eq? x y))

(define (list-equal? x y)
    (cond ((and (null? x) (null? y))    ; 空表
            #t)
          ((or (null? x) (null? y))     ; 长度不同的表
            #f)
          ((equal? (car x) (car y))     ; 对比 car 部分
            (equal? (cdr x) (cdr y)))   ; 递归对比 cdr 部分
          (else
            #f)))

(equal? '(this is a list) '(this is a list))
(equal? '(this (is a) list) '(this (is a) list))
(equal? '(this is a list) '(this (is a) list))