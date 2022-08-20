#lang racket/base

(provide mapping)
(require  "../../../private/mapping.rkt")

(define (mapping #:scribble? [scribble? #f])
  (gen-mapping-data data #:scribble? scribble?))
(define data
  '((char? 字?)
    (symbol? 词?)
    (keyword? 参词? "因与词类似，但是却主要是定义例程使用参数时才使用的。") ;; 牌?
    (keyword<? 参词<?)
    (string? 诗?)
    (string 诗)

    (symbol->string 词->诗)
    (string->symbol 诗->词)

    (string->keyword 诗->参词)
    (keyword->string 参词->诗)

    (string->list 诗->链)

    (syntax 文)
    (syntax? 文?)
    (identifier? 名?)

    (syntax->datum 文->料)
    (syntax->list 文->链)
    (datum->syntax 料->文)
    )
  )

