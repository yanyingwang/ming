#lang racket/base

(provide gen-mapping-data)

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
