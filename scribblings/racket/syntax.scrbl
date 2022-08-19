
#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           scribble-rainbow-delimiters
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base)))


@script/rainbow-delimiters*

@title[#:tag "cssisd"]{字相关}
@declare-exporting[ming]


对名语言来说，语言构成的最基本单位称之为字（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "Character"]）。多个字可以构成词（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "symbol"]）或诗@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "string"]。请注意，这里的词或者诗都是一种数据结构，和@racket[链]类似。

对名语言（LISP）来说，词和链是比较特殊的一种数据结构，因为这两者是语言在语法（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "Syntax"]）层面所使用到的数据结构。所谓的语法即是包含了上下文关系和作用域等的数据，对名来说，数据称之为“料”（原料的意思），包含了上下文关系和作用域的数据称之为“文”。


@examples[#:eval (the-eval)

(字? #\梨) @; character

(词? '香梨) @; symbol
(要词? '#:香梨) @;keyword 重要的词

(诗? "一个香梨") @; string
(诗->词 "一个香梨") @; (string->symbol ...)
(诗->字/链 "一个香梨") @;(string->list ...)

(名? 一个香梨) @; identifier? 符 号

(文 一个香梨) @; syntax
(文 '一个香梨)
(文 "一个香梨")
(文->料 #'(1 香梨 "一个香梨")) @; syntax->datum
(文->链 #'(1 香梨 "一个香梨")) @; syntax->list

(料->文 #f 1) @; datum->syntax
(料->文 #f '一个香梨)
(料->文 #f '(1 香梨 "一个香梨"))
]

@section{字符}
