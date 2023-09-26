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


@title[#:tag "vector"]{􏻿}
@margin-note{另见名扩展库：@secref["ming-vector"]}
“􏻿”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "vector"]）是类似于“@secref["pairs-and-lists"]”的一种数据结构，通常被称为“数组”。


@section[#:tag "rules"]{例程命名规则}
见@secref["naming-rules"]，有：

@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)
         (list (list @bold{规则} @bold{含义} @bold{进出参} @bold{举例})
               (list
               @elem{对@bold{@litchar{􏻿}}加@bold{@litchar{山}}/@bold{@litchar{氵}}中任一者的}
               @elem{指示内容是否可变}
               @elem{是不可或可被增加、删除或修改的}
               @elem{@racket[􏻼?]、@racket[􏻽?]}
               )
               (list
               @elem{对@bold{@litchar{􏻿}}加偏旁}
               @elem{构造生成特殊元素组成的@racket[􏻿]}
               @elem{出参数据结构是@racket[􏻿]}
               @elem{@racket[􏻺]、@racket[􏻻]、@racket[􏻹]}
               )
               (list
               @elem{左偏旁@bold{@litchar{亻}}}
               "相似集（类型相同且元素相似）"
               @elem{出参数据与进参数据相比，类型相同且内容类似}
               @elem{@racket[􏻿𠆯]}
               )
               @; (list
               @; @elem{@litchar{土}偏旁}
               @; @elem{构建}
               @; @elem{含有“构建”的意思}
               @; @elem{@racket[􏻿㙏!]}
               @; )
               (list
               @elem{@bold{@litchar{扌}}偏旁}
               @elem{指示修改方式}
               @elem{直接修改了原始数据}
               @elem{@racket[􏻿􏾩]、@racket[􏻿􏽒]、@racket[􏻿挌]}
               )
               @; (list
               @; @elem{以@litchar{􏻿}结尾}
               @; @elem{指示出参}
               @; @elem{出参数据是@racket[􏻿]类数据}
               @; @elem{@racket[复􏻿]、@racket[序􏻿]、@racket[贯􏻿]}
               @; )
               (list
               @elem{以@bold{@litchar{􏻿}}起头}
               @elem{指示入参}
               @elem{入参数据是@racket[􏻿]类数据}
               @elem{@racket[􏻿巨]、@racket[􏻿弔]、@racket[􏻿𠆯]}
               )
               (list
               @elem{以@bold{@litchar{化}}结尾}
               @elem{类型转换}
               @elem{出参数据内容不变而类型作小幅度改变}
               @elem{@racket[􏻼化]}
               )
               (list
               @elem{以@bold{@litchar{化}}联结}
               @elem{类型转换}
               @elem{出参数据内容不变而类型改变}
               @elem{@racket[􏻿化􏿴]、@racket[􏿴化􏻿]}
               )
               @; (list
               @; @elem{@litchar{!}结尾}
               @; @elem{指示修改方式}
               @; @elem{直接修改了原始数据}
               @; @elem{@racket[􏻿㙏!]}
               @; )
               (list
               @elem{@bold{@litchar{+}}结尾}
               @elem{入参}
               @elem{入参数据以相同方式多次出现}
               @elem{@racket[􏻿􏾩+]}
               )
         )
         ]

@section+elemref{􏻿，􏻽、􏻼，􏻿?，􏻽?、􏻼?，􏻸?}
@margin-note{
@bold{@litchar{􏻿}为新造字} @linebreak{}
@bold{@litchar{􏻽}为新造字} @linebreak{}
@bold{@litchar{􏻼}为新造字} @linebreak{}
@bold{@litchar{􏻸}为新造字}
@itemlist[
@item{@litchar{矢}：“矢量（vector）”的意思，呈现为半包围结构，表示该数据结构与@racket[􏿴]类似；}
@item{@litchar{十}：本意是“十个元素”，在这里引申为“元素长度是固定的”之意；}
@item{@litchar{山}：稳定的、内容不变的（因“山”是稳定的，见：@racket[固?]）；}
@item{@litchar{氵}：易动的、内容可变的（因为“水”是易变的，见：@racket[易?]）；}
@item{@litchar{穴}：简写，通@litchar{空}；}
]
}
@margin-note{
参见：@racket[固?]、@racket[易?] @linebreak{}
}
相比于@racket[􏿴]，在以下场景下使用@racket[􏻿]会更具效率优势：元素长度确定、需要频繁获取或修改元素而不需要增加或移除元素。  @linebreak{}
另外，“􏻿”按内容是否可以被修改，可以被分为：“易􏻿”和“固􏻿”，简写为“􏻽”和“􏻼”，“􏻽”为默认值。
@examples[#:eval (the-eval)
(􏻿 1 2 3 4)
(􏻽? (􏻿 1 2 3 4))

(􏻼 1 2 3 4)
(􏻼? (􏻼 1 2 3 4))
(􏻼? '#(1 2 3 4))

(􏻿? (􏻿 1 2 3 4))
(􏻿? (􏻼 1 2 3 4))

(􏻸? (􏻿))
(􏻸? #())
]

@section+elemref{􏻺、􏻻，􏻹}
@margin-note{参见：@racket[􏼓]、@racket[􏼎]，@racket[􏿝]}
@examples[#:eval (the-eval)
(􏻺 5 'foo)
(􏻻 5 􏽊)
(􏻹 '#(1) '#(2) '#(3) '#(4))
]

@section+elemref{􏻿巨，􏻿弔，􏻿𠆯、􏻿􏽒}
@margin-note{参见：@racket[巨]，@racket[弔]，@racket[𠆯]}
@examples[#:eval (the-eval)
(􏻿巨 '#(1 2 3 4))
(􏻿弔 '#(a b c d) 2)
(􏻿𠆯 '#(1 222 35 4) <)
(􏻿􏽒 (􏻿 1 222 35 4) <)
]

@section+elemref{􏻼化，􏻿化􏿴、􏿴化􏻿、􏻿􏾝化􏸼}
@margin-note{参见：@racket[􏻼]、@racket[􏻿􏾝]  @;、@racket[􏻿化􏸼]
}
@; @margin-note{另见：@racket[􏻿􏾝化􏸼*]}
@examples[#:eval (the-eval)
(􏻼化 '#(a b c d))
(􏿴化􏻿 '(a b c d))
(􏻿化􏿴 '#(a b c d))
(􏻿􏾝化􏸼 '#(a b c d) 0 2)
]

@section+elemref{􏻿􏾺、􏻿􏷵、􏻿􏾺分、􏻿􏾝}
@margin-note{参见：@racket[􏾺]，@racket[􏾺分]，@racket[􏾝]}
@; @margin-note{另见：@racket[􏻿􏾝*]}

@examples[#:eval (the-eval)
(􏻿􏾺 '#(a b c d e f) 2)
(􏻿􏷵 '#(a b c d e f) 2)
(􏻿􏾺分 '#(a b c d e f) 2)
(􏻿􏾝 '#(a b c d e f) 0 2)
]

@section+elemref{􏻿弓，􏻿佫、􏻿挌，􏻿􏹈，􏻿􏹇}
@margin-note{参见：@racket[弓]，@racket[佫]，@racket[􏹇]}
@examples[#:eval (the-eval)
(􏻿弓 'c '#(a b 1 c 2 d 3 e))
(􏻿佫 􏽊 '#(1 2 3 4))
(􏻿􏹈 􏻛? '#(1 2 -3 4))
(􏻿􏹇 􏻛? '#(1 2 -3 4))

(名 vec (􏻿 1 2 3 4))
(􏻿挌 􏽊 vec)
vec
]

@section+elemref{􏻿􏾩，􏻿􏾩+，􏻺𰅡，􏻿􏾩/以􏾝}
@margin-note{参见：@racket[􏾝]、@racket[攸]}
@margin-note{另见：@racket[􏻿􏾝] @;、@racket[􏻿􏾩/以􏾝*]
}
@examples[#:eval (the-eval)
(名 vec (􏻿 'a 'b 'c 'd))
vec
(􏻿􏾩 vec 1 'x)
vec
(􏻿􏾩+ vec 1 'y 2 'y)
vec
(􏻺𰅡 vec 'z)
vec
(􏻿􏾩/以􏾝 vec 0 '#(aa bb cc dd) 1 3)
vec
]

@section[#:tag "vector-base"]{基础例程}
@defmodule[ming/racket/base]
@defmapping[racket/base/vector]

@section[#:tag "vector-additional"]{额外例程}
@defmodule[ming/racket/vector]
@defmapping[racket/vector]
