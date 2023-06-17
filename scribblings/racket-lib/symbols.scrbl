#lang scribble/manual

@(require (for-label racket ming ming/list)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/symbol)))


@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*

@title[#:tag "symbols"]{勺}
“勺”（@tech[#:doc '(lib "scribblings/reference/reference.scrbl") "symbols"]）是一种跟@secref["string"]类似的数据结构，但是它更广泛的在Racket语言的内部实现中被使用。

@section[#:tag "list-rules"]{例程命名规则}
见@secref["naming-rules"]中关于@litchar{化}和@litchar{土}的条目。


@section+elemref{勺?、􏺏?、􏺋?，􏺌}
“勺”可以被细分为：“􏺏”（interned）、“􏺎”（unreadable/partially interned）、“􏺍”（uninterned）。

@examples[#:eval (the-eval)
(勺? 'symbol)
(􏺏? 'symbol)
(􏺋? 'symbol)
(􏺌 'symbol)
(􏺏? (􏺌 'symbol))
]


@section+elemref{转化例程：勺化􏽁、勺化句、句化勺、句化􏺍、句化􏺋}
@examples[#:eval (the-eval)
(勺化􏽁 'symbol)
(勺化句 'symbol)

(句化勺 "string")
(句化􏺍 "string")
(句化􏺋 "string")
]



@margin-note{
@bold{@litchar{勺}为古活字} @linebreak{}
@bold{@litchar{􏺋}为新造字} @linebreak{}
@bold{@litchar{􏺍}为新造字}
@itemlist[
@item{@litchar{勹}：工厂、容器、外壳；}
@item{@litchar{一}：数据内容；}
@item{@litchar{罒}：@litchar{目}；}
@item{@litchar{曰}：不可读的（仿@litchar{罒}得造）；}
@item{@litchar{由}：自由的；}
@item{@litchar{勺}：因为外形和@racket[勾]、@racket[句]相近，在此借用为表示@racket[勺]是和它们相近的一种数据结构；}
]
}

@section[#:tag "symbols-base"]{基础例程}
@defmapping[
racket/base/symbols
]

@section[#:tag "symbols-additional"]{额外例程}
@defmodule[ming/racket/symbol]
@defmapping[racket/symbol]
