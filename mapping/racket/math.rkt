
#lang racket/base

(provide mapping)
(require  "../../private/mapping.rkt")

(define (mapping #:scribble? [scribble? #f])
  (gen-mapping-data data #:scribble? scribble?))
(define data
  '(
    (pi 圆周率)
    (sqr 平方)
    (random 随机数)
    (infinite? 无穷大?)
    (positive-integer? 正整数?)
    (negative-integer? 负整数?)
    (nonpositive-integer? 非正整数?)
    (nonnegative-integer? 非负整数?)
    (natural? 自然数?)
    )
  )
