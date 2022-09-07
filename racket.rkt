#lang racket/base

(require (for-syntax racket/base racket/string racket/runtime-path))

(begin-for-syntax
  (define-runtime-path the-path "racket")
  (define the-files
    (for/list ([f (directory-list the-path)]
               #:when (string-suffix? (path->string f) ".rkt"))
      (format "racket/~a" f))))

(define-syntax (require-and-provide-racket/* stx)
  (datum->syntax stx `(begin
                        (require ,@the-files)
                        (provide (all-from-out ,@the-files)))))

(require-and-provide-racket/*)
