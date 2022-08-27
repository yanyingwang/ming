#lang racket/base

(provide (except-out (all-from-out racket/base) #%module-begin)
         (rename-out (module-begin #%module-begin)))

(define-syntax-rule (module-begin expr ...)
  (#%module-begin
   (provide mapping)

   (define data `(expr ...))
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