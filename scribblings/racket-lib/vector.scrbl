#lang scribble/manual

@(require (for-label racket ming ming/list ming/vector)
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
@margin-note{另见名扩展库：@secref["ming-vector"]}

@section[#:tag "rules"]{例程命名规则}
除总@secref["naming-rules"]外，另有：

@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)
         (list (list @bold{规则} @bold{含义} @bold{进出参} @bold{举例})
               (list
               @elem{以@litchar{􏿲}结尾}
               @elem{指示出参}
               @elem{出参数据是@racket[􏿲]类数据}
               @elem{@racket[复􏿲]、@racket[序􏿲]、@racket[贯􏿲]}
               )
               (list
               @elem{以@litchar{􏿲}起头}
               @elem{指示入参}
               @elem{入参数据是@racket[􏿲]类数据}
               @elem{@racket[􏿲度]、@racket[􏿲弔]、@racket[􏿲𠆯]}
               )
               (list
               @elem{以@litchar{化}结尾}
               @elem{类型转换}
               @elem{出参数据内容不变而类型作小幅度改变}
               @elem{@racket[􏿲固化]、@racket[􏿲复化!]}
               )
               (list
               @elem{以@litchar{化}联结}
               @elem{类型转换}
               @elem{出参数据内容不变而类型改变}
               @elem{@racket[􏿲化􏿴]、@racket[􏿴化􏿲]}
               )
         )
         ]

@section+elemref{􏿲，固􏿲，空􏿲?，􏿲?}
@margin-note{
@bold{@litchar{􏿲}为新造字}
@itemlist[
@item{该字中的偏旁@litchar{矢}是“矢量”（vector）的意思；}
@item{偏旁@litchar{矢}呈现为半包围结构，表示其所代表的数据也是一种类似@racket[􏿴]一样的链状结构。}
]
}

“􏿲”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "vector"]）是和“@racket[􏿴]”类似的一种数据结构，但显著的一个不同是访问和更新其元素值的时间复杂度是@hyperlink["https://zh.wikipedia.org/wiki/%E5%B8%B8%E6%95%B8%E6%99%82%E9%96%93" "常数时间"]。@linebreak{}
@margin-note{
参见：@racket[固?]、@racket[易?] @linebreak{}
另见：@racket[易􏿲]、@racket[易􏿲?]、@racket[固􏿲?]、@racket[空􏿲]}
@examples[#:eval (the-eval)
(􏿲 1 2 3 4)
(固􏿲 1 2 3 4)
(固? (􏿲 1 2 3 4))
(固? (固􏿲 1 2 3 4))
(固? '#(1 2 3 4))
(􏿲? (􏿲 1 2 3 4))
(􏿲? (固􏿲 1 2 3 4))
(空􏿲? #())
]

@section+elemref{复􏿲、序􏿲，贯􏿲}
@margin-note{参见：@racket[复􏿴]、@racket[序􏿴]，@racket[􏿝]}
@examples[#:eval (the-eval)
(复􏿲 5 'foo)
(序􏿲 5 加一)
(贯􏿲 '#(1) '#(2) '#(3) '#(4))
]

@section+elemref{􏿲度，􏿲弔，􏿲𠆯}
@margin-note{参见：@racket[度]，@racket[弔]，@racket[𠆯]}
@examples[#:eval (the-eval)
(􏿲度 '#(1 2 3 4))
(􏿲弔 '#(a b c d) 2)
(􏿲𠆯 '#(1 222 35 4) <)
]

@section+elemref{􏿲固化，􏿲化􏿴、􏿴化􏿲、􏿲􏾝化殖}
@margin-note{
参见：@racket[固?]，@racket[固􏿲]、@racket[􏿲􏾝]、@racket[􏿲化殖] @linebreak{}
另见：@racket[􏿲􏾝化殖*]
}
@examples[#:eval (the-eval)
(􏿲固化 '#(a b c d))
(􏿴化􏿲 '(a b c d))
(􏿲化􏿴 '#(a b c d))
(􏿲􏾝化殖 '#(a b c d) 0 2)
]

@section+elemref{􏿲􏾺、􏿲􏷵、􏿲􏾺分、􏿲􏾝}
@margin-note{
参见：@racket[􏾺]，@racket[􏾺分]，@racket[􏾝] @linebreak{}
另见：@racket[􏿲􏾝*]
}

@examples[#:eval (the-eval)
(􏿲􏾺 '#(a b c d e f) 2)
(􏿲􏷵 '#(a b c d e f) 2)
(􏿲􏾺分 '#(a b c d e f) 2)
(􏿲􏾝 '#(a b c d e f) 0 2)
]

@section+elemref{􏿲引，􏿲佫，􏿲􏷹，􏿲􏷶}
@margin-note{参见：@racket[引]，@racket[佫]，@racket[􏷶]}
@examples[#:eval (the-eval)
(􏿲引 'c '#(a b 1 c 2 d 3 e))
(􏿲佫 加一 '#(1 2 3 4))
(􏿲􏷹 正数? '#(1 2 -3 4))
(􏿲􏷶 正数? '#(1 2 -3 4))
]

@section+elemref{􏿲攸!，􏿲攸-*!，􏿲复化!，􏿲攸!/以􏾝}
@margin-note{
参见：@racket[复􏿲]，@racket[􏾝]、@racket[攸] @linebreak{}
另见：@racket[􏿲􏾝]、@racket[􏿲攸!/以􏾝*]
}
@examples[#:eval (the-eval)
(名 vec (􏿲 'a 'b 'c 'd))
vec
(􏿲攸! vec 1 'x)
vec
(􏿲攸-*! vec 1 'y 2 'y)
vec
(􏿲复化! vec 'z)
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
