#lang scribble/manual

@(require (for-label racket ming ming/list ming/vector)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/vector ming/vector)))


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
               @elem{对@litchar{􏿴}加偏旁}
               @elem{构造生成特殊元素组成的@racket[􏿴]}
               @elem{出参数据结构是@racket[􏿴]}
               @elem{@racket[􏼊]、@racket[􏼋]、@racket[􏼉]}
               )
               (list
               @elem{左偏旁@litchar{亻}}
               "相似集（类型相同且元素相似）"
               @elem{出参数据与进参数据相比，类型相同且内容类似}
               @elem{@racket[􏿲𠆯]}
               )
               @; (list
               @; @elem{@litchar{土}偏旁}
               @; @elem{构建}
               @; @elem{含有“构建”的意思}
               @; @elem{@racket[􏿲㙏!]}
               @; )
               (list
               @elem{@litchar{扌}偏旁}
               @elem{指示修改方式}
               @elem{直接修改了原始数据}
               @elem{@racket[􏿲􏾩]、@racket[􏿲􏽒]、@racket[􏿲挌]}
               )
               @; (list
               @; @elem{@litchar{!}结尾}
               @; @elem{指示修改方式}
               @; @elem{直接修改了原始数据}
               @; @elem{@racket[􏿲㙏!]}
               @; )
               (list
               @elem{@litchar{^-}结尾}
               @elem{指示入参}
               @elem{入参数据以相同方式多次出现}
               @elem{@racket[􏿲􏾩^-]}
               )
               @; (list
               @; @elem{以@litchar{􏿲}结尾}
               @; @elem{指示出参}
               @; @elem{出参数据是@racket[􏿲]类数据}
               @; @elem{@racket[复􏿲]、@racket[序􏿲]、@racket[贯􏿲]}
               @; )
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
               @elem{@racket[􏽔化]}
               )
               (list
               @elem{以@litchar{化}联结}
               @elem{类型转换}
               @elem{出参数据内容不变而类型改变}
               @elem{@racket[􏿲化􏿴]、@racket[􏿴化􏿲]}
               )
         )
         ]

@section+elemref{􏿲，􏽓、􏽔，􏿲?，􏽓?、􏽔?，空􏿲、空􏿲?}
@margin-note{
@bold{@litchar{􏿲}为新造字} @linebreak{}
@bold{@litchar{􏽓}为新造字} @linebreak{}
@bold{@litchar{􏽔}为新造字}
@itemlist[
@item{@litchar{矢}：矢量（vector）；}
@item{偏旁@litchar{矢}呈现为半包围结构，表示其所代表的数据也是一种类似@racket[􏿴]一样的链状结构。}
@item{@litchar{山}：稳定的、内容不变的（因“山”是稳定的，见：@racket[固?]）；}
@item{@litchar{氵}：易动的、内容可变的（因为“水”是易变的，见：@racket[易?]）；}
]
}
@margin-note{
参见：@racket[固?]、@racket[易?] @linebreak{}
}
“􏿲”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "vector"]）是和“@racket[􏿴]”类似的一种数据结构，但显著的一个不同是访问和更新其元素值的时间复杂度是@hyperlink["https://zh.wikipedia.org/wiki/%E5%B8%B8%E6%95%B8%E6%99%82%E9%96%93" "常数时间"]。@linebreak{}
“􏿲”按内容是否可以被修改，可以被分为：“易􏿲”和“固􏿲”，简写为“􏽔”和“􏽓”。@racket[􏿲]默认创建的是“􏽓”。@linebreak{}


@examples[#:eval (the-eval)
(􏿲 1 2 3 4)
(􏽓? (􏿲 1 2 3 4))

(􏽔 1 2 3 4)
(􏽔? (􏽔 1 2 3 4))
(􏽔? '#(1 2 3 4))

(􏿲? (􏿲 1 2 3 4))
(􏿲? (􏽔 1 2 3 4))

(空􏿲? (􏿲))
(空􏿲? #())
]

@section+elemref{􏼊、􏼋，􏼉}
@margin-note{参见：@racket[􏼓]、@racket[􏼎]，@racket[􏿝]}
@examples[#:eval (the-eval)
(􏼊 5 'foo)
(􏼋 5 􏽊)
(􏼉 '#(1) '#(2) '#(3) '#(4))
]

@section+elemref{􏿲度，􏿲弔，􏿲𠆯、􏿲􏽒}
@margin-note{参见：@racket[度]，@racket[弔]，@racket[𠆯]}
@examples[#:eval (the-eval)
(􏿲度 '#(1 2 3 4))
(􏿲弔 '#(a b c d) 2)
(􏿲𠆯 '#(1 222 35 4) <)
(􏿲􏽒 (􏿲 1 222 35 4) <)
]

@section+elemref{􏽔化，􏿲化􏿴、􏿴化􏿲、􏿲􏾝化殖}
@margin-note{参见：@racket[􏽔]、@racket[􏿲􏾝]、@racket[􏿲化殖]}
@margin-note{另见：@racket[􏿲􏾝化殖*]}
@examples[#:eval (the-eval)
(􏽔化 '#(a b c d))
(􏿴化􏿲 '(a b c d))
(􏿲化􏿴 '#(a b c d))
(􏿲􏾝化殖 '#(a b c d) 0 2)
]

@section+elemref{􏿲􏾺、􏿲􏷵、􏿲􏾺分、􏿲􏾝}
@margin-note{参见：@racket[􏾺]，@racket[􏾺分]，@racket[􏾝]}
@margin-note{另见：@racket[􏿲􏾝*]}

@examples[#:eval (the-eval)
(􏿲􏾺 '#(a b c d e f) 2)
(􏿲􏷵 '#(a b c d e f) 2)
(􏿲􏾺分 '#(a b c d e f) 2)
(􏿲􏾝 '#(a b c d e f) 0 2)
]

@section+elemref{􏿲引，􏿲佫、􏿲挌，􏿲􏷹，􏿲􏷶}
@margin-note{参见：@racket[引]，@racket[佫]，@racket[􏷶]}
@examples[#:eval (the-eval)
(􏿲引 'c '#(a b 1 c 2 d 3 e))
(􏿲佫 􏽊 '#(1 2 3 4))
(􏿲􏷹 􏽌? '#(1 2 -3 4))
(􏿲􏷶 􏽌? '#(1 2 -3 4))

(名 vec (􏿲 1 2 3 4))
(􏿲挌 􏽊 vec)
vec
]

@section+elemref{􏿲􏾩，􏿲􏾩^-，􏼊𰅡，􏿲􏾩/以􏾝}
@margin-note{参见：@racket[复􏿲]，@racket[􏾝]、@racket[攸]}
@margin-note{另见：@racket[􏿲􏾝]、@racket[􏿲􏾩/以􏾝*]}
@examples[#:eval (the-eval)
(名 vec (􏿲 'a 'b 'c 'd))
vec
(􏿲􏾩 vec 1 'x)
vec
(􏿲􏾩^- vec 1 'y 2 'y)
vec
(􏼊𰅡 vec 'z)
vec
(􏿲􏾩/以􏾝 vec 0 '#(aa bb cc dd) 1 3)
vec
]

@section[#:tag "vector-base"]{基础例程}
@defmapping[
racket/base/vector
]

@section[#:tag "vector-additional"]{额外例程}
@defmodule[ming/racket/vector]
@defmapping[racket/vector]
