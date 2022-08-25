#lang racket/base


;; TODO: enh below code to support usage like this: (provide-with-mingizily-require racket/list racket/base)
(provide provide-with-mingizily-require)
(require "match-files-in.rkt"
         (for-syntax racket/base racket/syntax racket/syntax
                     (match-files-in ../mapping (#rx"^/([a-z]+)\\.rkt$"
                                                 #rx"^/racket/([a-z]+)\\.rkt$"))))

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

