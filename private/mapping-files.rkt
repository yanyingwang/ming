#lang racket/base

(provide mapping-files)
(require racket/runtime-path racket/string)

(define-runtime-path the-path "../mapping")
(define mapping-files
  (for/list ([f (in-directory the-path)]
             #:when (string-suffix? (path->string f) ".rkt"))
    (string-replace (path->string f) #rx".*/mapping" "")))
