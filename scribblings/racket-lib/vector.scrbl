#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/vector)))


@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "vector"]{􏿲}

@section+elemref{􏿲、贞􏿲，空􏿲?，􏿲?}
@margin-note{
@bold{@litchar{􏿲}为新造字}
@itemlist[
@item{该字中的偏旁@litchar{矢}是“矢量”（vector）的意思；}
@item{偏旁@litchar{矢}呈现为半包围结构，表示其所代表的数据也是一种类似@racket[􏿴]一样的链状结构。}
]
}

“􏿲”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "vector"]）是和“@racket[􏿴]”类似的一种数据结构，但显著的一个不同是访问和更新其元素值的时间复杂度是@hyperlink["https://zh.wikipedia.org/wiki/%E5%B8%B8%E6%95%B8%E6%99%82%E9%96%93" "常数时间"]。@linebreak{}

@examples[#:eval (the-eval)
(􏿲 1 2 3 4)
(贞􏿲 1 2 3 4)
(贞? (􏿲 1 2 3 4))
(贞? '#(1 2 3 4))
(空􏿲? #())
]

@section+elemref{复􏿲、序􏿲，贯􏿲}
@examples[#:eval (the-eval)
(复􏿲 5 'foo)
(序􏿲 5 加一)
(贯􏿲 '#(1) '#(2) '#(3) '#(4))
]

@section+elemref{􏿲度、􏿲弔、􏿲􏿀}
@margin-note{另见：@racket[弔]}
@examples[#:eval (the-eval)
(􏿲度 '#(1 2 3 4))
(􏿲弔 '#(a b c d) 2)
(􏿲􏿀 '#(1 222 35 4) <)
]

@section+elemref{􏿲贞化，􏿲化􏿴、􏿴化􏿲、􏿲化殖}
@examples[#:eval (the-eval)
(􏿲贞化 '#(a b c d))
(􏿴化􏿲 '(a b c d))
(􏿲化􏿴 '#(a b c d))
(􏿲化殖 '#(a b c d))
(􏿲􏾝化殖 '#(a b c d) 0 2)
(􏿲􏾝*化殖 '#(a b c d) 0 2)
]

@section+elemref{􏿲􏾺、􏿲􏷵、􏿲􏾺分、􏿲􏾝}
@margin-note{另见：@racket[􏾺]、@racket[􏾺分]、@racket[􏾝]}
@examples[#:eval (the-eval)
(􏿲􏾺 '#(a b c d e f) 2)
(􏿲􏷵 '#(a b c d e f) 2)
(􏿲􏾺分 '#(a b c d e f) 2)
(􏿲􏾝 '#(a b c d e f) 0 2)
]

@section+elemref{􏿲引，􏿲佫，􏿲􏷹，􏿲􏷶}
@margin-note{另见：@racket[􏾺]、@racket[􏾺分]、@racket[􏾝]}
@examples[#:eval (the-eval)
(􏿲引 'c '#(a b 1 c 2 d 3 e))
(􏿲佫 加一 '#(1 2 3 4))
(􏿲􏷹 正数? '#(1 2 -3 4))
(􏿲􏷶 正数? '#(1 2 -3 4))
]

@section+elemref{􏿲攸!、􏿲复化!、􏿲攸!/以􏾝}
@examples[#:eval (the-eval)
(名 vec (􏿲 'a 'b 'c 'd))
vec
(􏿲攸! vec 1 'x)
vec
(􏿲复化! vec 'x)
vec
(􏿲攸!/以􏾝 vec 0 '#(aa bb cc dd) 1 3)
vec
]



@section[#:tag "vector-base"]{基础例程}
@defmapping[
racket/base/vector
]


@section[#:tag "vector-additional"]{额外例程}
@defmodule[ming/racket/vector]
@defmapping[racket/vector]
