#lang racket/base

(provide (except-out (all-from-out racket/base)
                     #%module-begin)
         (rename-out (module-begin #%module-begin)))

(define-syntax-rule (module-begin expr ...)
  (#%module-begin
   (provide mapping)
   (require  "../../../private/mapping.rkt")
   (define data `(expr ...))
   (define (mapping #:scribble? [scribble? #f])
     (gen-mapping-data data #:scribble? scribble?))))
