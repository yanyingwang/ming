#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/keyword)))


@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*

@title[#:tag "keywords"]{勾}
“勾”（@tech[#:doc '(lib "scribblings/reference/reference.scrbl") "keywords"]）是与@secref["symbols"]类似的数据结构，特别地被用于例程的参数中使用。


@section[#:tag "list-rules"]{例程命名规则}
见@secref["naming-rules"]中关于@litchar{化}的条目。


@section+elemref{勾?，勾化句、句化勾、勾化􏽁}
@margin-note{
@bold{@litchar{勾}为活用字}
@itemlist[
@item{@litchar{勹}：工厂、容器、外壳；}
@item{@litchar{厶}：参数（通@litchar{参}）；}
@item{@litchar{勾}：在古代通@litchar{句}，在此借用为表示@racket[勾]是和@racket[句]相近的一种数据结构；}
]
}
@examples[#:eval (the-eval)
(勾? '#:keyword)

(勾化句 '#:keyword)
(勾化􏽁 '#:keyword)
(句化勾 "string")
]



@section[#:tag "symbols-base"]{基础例程}
@defmapping[
racket/base/keywords
]

@section[#:tag "symbols-additional"]{额外例程}
@defmodule[ming/racket/keywords]
@defmapping[racket/keyword]
