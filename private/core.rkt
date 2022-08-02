#lang racket/base


(provide provide-with-mingizily-require)
(require
 (for-syntax racket/base racket/syntax
             (rename-in "../mapping/racket.rkt" [mapping minglize-mapping/racket])
             (rename-in "../mapping/racket/base.rkt" [mapping minglize-mapping/racket/base])
             (rename-in "../mapping/racket/list.rkt" [mapping minglize-mapping/racket/list])))

(begin-for-syntax (define-namespace-anchor anchor)
                  (define ns (namespace-anchor->namespace anchor))
                  (define (ming-mapping path)
                    ((eval (format-id path "minglize-mapping/~a" path) ns))))

(define-syntax (provide-with-mingizily-require stx)
  (syntax-case stx ()
    [(_ path)
     (datum->syntax stx
                    `(begin (require ,(syntax-e #'path))
                            (provide (rename-out ,@(ming-mapping #'path)))))]))


#| usage:
(require "private/core.rkt")
(provide-with-mingizily-require racket/list)
|#
