#lang racket/base

(require (for-syntax racket/base racket/runtime-path))

(begin-for-syntax
  (define-runtime-path the-path "racket")
  (define the-files
    (for/list ([f (directory-list the-path)])
      (format "racket/~a" f))))

(define-syntax (require-racket/* stx)
  (datum->syntax stx `(require ,@the-files)))

(define-syntax (provide-racket/* stx)
  (datum->syntax stx `(provide (all-from-out ,@the-files))))

(provide-racket/*)
(require-racket/*)