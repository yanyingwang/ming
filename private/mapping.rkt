#lang racket/base

(provide gen-mapping-data mapping-files)
(require racket/runtime-path racket/string)

(define (gen-mapping-data data #:scribble? [scribble? #f])
  (for/list ([da data]
             #:do [(define a (car da))
                   (define b (cadr da))
                   (define c (if (= 3 (length da))
                                 (caddr da)
                                 ""))])
    (if scribble?
        (list a b c)
        (list a b)))
  )


(define-runtime-path the-path "../mapping")
(define mapping-files
  (for/list ([f (in-directory the-path)]
             #:when (string-suffix? (path->string f) ".rkt"))
    (string-replace (path->string f) #rx".*/mapping" "")))
