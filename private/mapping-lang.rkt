#lang racket/base

(provide (except-out (all-from-out racket/base) #%module-begin)
         (rename-out (module-begin #%module-begin)))

(define-syntax-rule (module-begin expr ...)
  (#%module-begin
   (provide mapping)
   (define data
     (let loop ([lst '(expr ...)]
                [inner-lst '()]
                [result-lst '()])
       (if (null? lst)
           result-lst
           (loop (cdr lst)
                 (if (equal? (car lst) '>>>)
                     '()
                     (append inner-lst (list (car lst))))
                 (if (and (equal? (car lst) '>>>)
                          (not (null? inner-lst)))
                     (append result-lst (list inner-lst))
                     result-lst)))))
   (define (mapping #:scribble? [scribble? #f])
     (gen-mapping-data data #:scribble? scribble?))
   (define (gen-mapping-data data #:scribble? [scribble? #f])
     (for/list ([da data]
                #:do [(define a (car da))
                      (define b (cadr da))
                      (define c (if (= 3 (length da))
                                    (caddr da)
                                    ""))])
       (if scribble?
           (list a b c)
           (list a b))))
   ))