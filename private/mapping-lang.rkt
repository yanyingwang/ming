#lang racket/base

(provide (except-out (all-from-out racket/base) #%module-begin)
         (rename-out (module-begin #%module-begin)))

(define-syntax-rule (module-begin expr ...)
  (#%module-begin
   (provide mapping)
   (require racket/bool)
   (define mapping
     (let loop ([lst '(expr ...)])
       (cond [(null? lst) lst]
             [(and (symbol? (car lst)) (symbol=? (car lst) '>>>))
              (loop (cons '() (cdr lst)))]
             [(or (null? (cdr lst))
                  (and (symbol? (cadr lst)) (symbol=? (cadr lst) '>>>)))
              (cons (car lst) (loop (cdr lst)))]
             [else
              (loop (cons (append (car lst) `(,(cadr lst))) (cddr lst)))]
             )))
   ))
