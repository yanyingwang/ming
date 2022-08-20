#lang racket/base

(provide mapping)

(require (for-syntax racket/base racket/string racket/syntax racket/sequence racket/runtime-path))

(begin-for-syntax
  (define-runtime-path the-path "racket")
  (define the-files
    (for/list ([f (directory-list the-path)]
               #:when (string-suffix? (path->string f) ".rkt"))
      (format "racket/~a" f))))

(define-syntax (require-racket/* stx)
  (let ([sub-requires (for/list ([f the-files]
                                 [i (in-range (length the-files))])
                        `(rename-in ,f [mapping ,(format-symbol "mapping~a" i)]))])
    (datum->syntax stx `(require ,@sub-requires))))

(define-syntax (define-mapping stx)
  (let ([append-lists (for/list ([i (in-range (sequence-length the-files))])
                        `(,(format-symbol "mapping~a" i) #:scribble? scribble?))])
    (datum->syntax stx
                   `(define (mapping #:scribble? [scribble? #f])
                      (append ,@append-lists)))))


(require-racket/*)
(define-mapping)

