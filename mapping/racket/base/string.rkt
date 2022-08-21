#lang racket/base

(provide mapping)
(require  "../../../private/mapping.rkt")

(define (mapping #:scribble? [scribble? #f])
  (gen-mapping-data data #:scribble? scribble?))
(define data
  '([string? 诗?]
    [string 易诗 "创建一个可以内容改变的字符串数据结构。"] ;; TODO: create all the procedures started with 易 to 坚
    [make-string 易复诗 "创建一个可以内容改变的字符串数据结构，其内容为数个重复相同的字。"]
    [string->immutable-string 诗->坚诗 "把诗转变为坚诗。"]
    [string-length 诗长]
    [string-ref 诗引]
    [string-set! 诗改!]
    [substring 易取诗 "索引诗的N到F位之间的字，并组成一个易诗。"]
    [string-copy 诗->易诗 "把诗转变为易诗。"]
    [string-copy! 易引覆诗 "从另一个诗中的某段索引位置取出相应的字，用之从本诗的某处索引位置开始覆盖掉相应的字。"]
    [string-fill! 诗复! "把诗的内容全部变成某一个重复的一个字。"]
    [string-append 易连诗 "把很多诗连在一块。"]
    [string-append-immutable 坚连诗 "把很多诗连在一块，组成坚诗。"]

    [string->list 诗->链]
    [list->string 链->易诗]
    [build-string 序诗 "生成一个诗，诗内容的每个字都是按照一定的顺序排列的。"]
    [string=? 诗=?]
    [string<? 诗<?]
    [string<=? 诗<=?]
    [string>? 诗>?]
    [string>=? 诗>=?]

    [string-ci=? 诗ci=?]
    [string-ci<? 诗ci<?]
    [string-ci<=? 诗ci<=?]
    [string-ci>? 诗ci>?]
    [string-ci>=? 诗ci>=?]

    [string-upcase upcase诗]
    [string-downcase downcase诗]
    [string-titlecase titlecase诗]
    [string-foldcase foldcase诗]

    )
  )
