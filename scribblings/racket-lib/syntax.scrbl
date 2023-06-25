#lang scribble/manual

@(require (for-label racket ming ming/list)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/list)))


@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "syntax"]{􏺃}
“􏺃”（@tech[#:doc '(lib "scribblings/reference/reference.scrbl") "syntax object"]）是Racket编程语言构建其语言的基石。


@section+elemref{􏺃，卩?，􏺃?}
“􏺃”其实就是通俗意义上的“代码”，而“代码”究其本质而言是封装了“词法信息”和“位置信息”的“数据”。“卩”（@tech[#:doc '(lib "scribblings/reference/reference.scrbl") "identifier"]）可以看作是“􏺃”的极简单特例。

@margin-note{
@bold{@litchar{卩}为古活字} @linebreak{}
@bold{@litchar{􏺃}为新造字} @linebreak{}
@itemlist[
@item{@litchar{卩}：@litchar{节}的古字，本意是“瑞信，古代出使等用作凭证之物”，引申为“语法，包含了上下文信息的数据”；}
@item{@litchar{厂}：工厂，容器，内容。}
]
}
@examples[#:eval (the-eval)
(􏺃? #'(+ 1 2))
(􏺃? #'(+ 1 2))
(􏺃? #'1)
(卩? #'1)
]


@section+elemref{位置信息：􏹷，􏹸、􏹹，􏹾，􏹵}
“􏺃”中的“位置信息”我们用单字“元”来表示，“元”包括：“􏹷”（地址）、“􏹾”（位置）、“􏹹”（经度（第几行））、“􏹸”（纬度（第几列））、“􏹵”（所占用的空间（长度））。
@margin-note{
@bold{@litchar{􏹷}为新造字} @linebreak{}
@bold{@litchar{􏹹}为新造字} @linebreak{}
@bold{@litchar{􏹸}为新造字} @linebreak{}
@bold{@litchar{􏹾}为新造字} @linebreak{}
@bold{@litchar{􏹵}为新造字} @linebreak{}
@itemlist[
@item{@litchar{止}：本意是“足”，在此为“地址”的意思；}
@item{@litchar{􏹹}：第几列，仿@litchar{经}字得造；}
@item{@litchar{􏹸}：第几行，仿@litchar{纬}字得造；}
@item{@litchar{􏹾}：第几位；}
]
}
@examples[#:eval (the-eval)
(􏹷 #'a)
(􏹹 #'a)
(􏹸 #'a)
(􏹾 #'a)
(􏹵 #'a)
]


@section+elemref{转化：􏹲，􏹩，􏹴、􏹳}
“数据”我们用单字“文”来表示，此如@racket[􏿴?]、@racket[􏻿?]、@racket[􏿰?]、@racket[句?]、@racket[勺?]等数据结构所构造出的数据都是“文”。 “文”添加上“词法信息”和“位置信息”就组成了“􏺃”，而“􏺃”剥离掉“词法信息”和“位置信息”就余下“文”了。
@margin-note{
@bold{@litchar{􏹲}为新造字} @linebreak{}
@bold{@litchar{􏹩}为新造字} @linebreak{}
@bold{@litchar{􏹴}为新造字} @linebreak{}
@bold{@litchar{􏹳}为新造字} @linebreak{}
@itemlist[
@; @item{@litchar{匕}：小幅度转化。}
@item{@litchar{􏹲}：@litchar{􏺃}+@litchar{解}各取偏旁得造；}
@item{@litchar{􏹩}：@litchar{􏺃}+@litchar{􏿴}各取偏旁得造；}
@item{@litchar{􏹴}：@litchar{􏺃}+@litchar{文}各取偏旁得造；}
@item{@litchar{􏹴}：@litchar{文}+@litchar{􏺃}各取偏旁得造；}
]
}
@margin-note{另见：@racket[􏼩]、@racket[􏼳]、@racket[􏼪]、@racket[􏼲]}
@examples[#:eval (the-eval)
(􏹲 #'a)
(􏹲 #'(a b c))
(􏹩 #'(a b c))
(􏹴 #'(a b c))
(􏹳 #f '(a b c))
]



@section[#:tag "syntax-base"]{基础例程}
@defmapping[
racket/base/syntax
]

@; @section[#:tag "syntax-additional"]{额外例程}
@; @defmodule[ming/racket/syntax]
@; @defmapping[racket/syntax]
