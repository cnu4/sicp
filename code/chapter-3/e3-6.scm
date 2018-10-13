(define random-init 1024)

(define rand
  (let ((x random-init))
    (lambda (mode)
      (cond ((eq? mode 'generate) (begin (set! x (random x)) x))
        ((eq? mode 'reset)
          (lambda (new-value)
            (set! x new-value) x))
      (else (error "Unkonw mode" mode))))))

(rand 'generate)
(rand 'generate)
((rand 'reset) 2048)
(rand 'generate)