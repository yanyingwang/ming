#lang racket/base

;; TODO: enh below code to support usage like this: (provide-with-mingizily-require racket/list racket/base)
(provide provide-with-mingizily-require)
(require (for-syntax racket/base racket/syntax
                     (rename-in "../mapping/racket.rkt" [mapping mapping/racket])
                     (rename-in "../mapping/racket/base.rkt" [mapping mapping/racket/base])
                     (rename-in "../mapping/racket/list.rkt" [mapping mapping/racket/list])
                     (rename-in "../mapping/racket/math.rkt" [mapping mapping/racket/math])))

(begin-for-syntax
  (define-namespace-anchor anchor)
  (define ns (namespace-anchor->namespace anchor))
  (define (get-mapping-data path)
    (eval `(,(format-symbol "mapping/~a" path)) ns)))



(define-syntax (provide-with-mingizily-require stx)
  (syntax-case stx ()
    [(_ path)
     (datum->syntax stx
                    `(begin (require ,(syntax-e #'path))
                            (provide (rename-out ,@(get-mapping-data #'path)))))]))



#| usage:
(require "private/core.rkt")
(provide-with-mingizily-require racket/list)
|#

