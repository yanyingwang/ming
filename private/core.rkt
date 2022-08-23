#lang racket/base

;; TODO: enh below code to support usage like this: (provide-with-mingizily-require racket/list racket/base)
(require (for-syntax racket/base racket/syntax racket/runtime-path racket/string))
(provide provide-with-mingizily-require)

(begin-for-syntax
  (define-runtime-path the-path "../mapping")
  (define the-files
    (for/list ([f (in-directory the-path)]
               #:when (and (string-suffix? (path->string f) ".rkt")
                           (not (string-contains? (path->string f) "/base/"))
                           )
               #:do [(define fstring (path->string f))])
      (string-replace fstring #rx".*/mapping" "mapping"))))

(define-syntax (require-mapping/* stx)

  (let ([sub-requires (for/list ([f the-files]
                                 #:do [(define file-path (string-append "../" f))
                                       (define new-mapping/path (path-replace-extension f #""))
                                       (define new-mapping (string->symbol (path->string new-mapping/path)))])
                        `(rename-in ,file-path [mapping ,new-mapping]))])
    (datum->syntax stx `(require (for-syntax ,@sub-requires)))))

(require-mapping/*)



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

