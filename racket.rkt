#lang racket/base

(require (for-syntax racket/base racket/runtime-path))

(begin-for-syntax
  (define-runtime-path the-path "racket")
  (define the-files
    (for/list ([f (directory-list the-path)])
      (format "racket/~a" f))))

(define-syntax (require-dir-with-provide/all-from-out stx)
  (syntax-case stx ()
    [(_ path)
     (datum->syntax stx `(begin
                           (require ,@the-files)
                           (provide (all-from-out ,@the-files))))]))

(require-dir-with-provide/all-from-out "racket")
