#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/vector)))

@(require (file "../../private/scribble-styles/css/fonts.css.rkt"))
@css/wenquan-extend-font
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "vector"]{􏿲}

@section{􏿲}
“􏿲”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "vector"]），和“􏿴”所代表的数据结构类似，但显著的一个不同是访问和更新其元素值的时间复杂度是@hyperlink["https://zh.wikipedia.org/wiki/%E5%B8%B8%E6%95%B8%E6%99%82%E9%96%93" "常数时间"]。


@margin-note{
@bold{“􏿲”为新造字：}
该字中的“矢”是“矢量”（vector）的意思，半包围结构表示其也是一个链状结构。
}



@examples[#:eval (the-eval)
]



@section[#:tag "vector-base"]{基础例程}
@defmapping[
racket/base/vector
]


@section[#:tag "vector-additional"]{额外例程}
@defmodule[ming/racket/vector]
@defmapping[racket/vector]
