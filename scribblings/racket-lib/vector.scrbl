#lang scribble/manual

@(require (for-label racket ming ming/list ming/vector ming/bool)
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
Originates from @secref["vectors" #:doc '(lib "scribblings/reference/reference.scrbl")] and extends to @secref["ming-vector"].


@section[#:tag "overall-of-vector"]{Overall}
@; Extended from @secref["naming-rules"], specifically there are：
@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)
         (list (list @bold{Rule} @bold{Example})
               (list
               @elem{@bold{@zi[亻]}}
               @elem{@rackets[􏻿􏷑 􏻿𠆯 􏻿􏹈]}
               )
               (list
               @elem{@bold{@zi[阝]}}
               @elem{@rackets[􏻿􏾺 􏻿𨚞]}
               )
               (list
               @elem{@bold{@zi[刂]}}
               @elem{@racket[􏻿􏷵 􏻿􏷴]}
               )
               (list
               @elem{@bold{@zi[扌]}}
               @elem{@rackets[􏻿􏾩 􏻿𢪛 􏻿􏽒]}
               )
               (list
               @elem{@bold{@zi[􏻿PFX]}}
               @elem{@racket[􏻿𠆯 􏻿􏷴 􏻿􏾩 􏻿􏽒]}
               ))]


@defideogr[矢 "something has specific direction or fixed length" "矢" "arrow"]
@defideogr[矢LB (矢 LB) "something similar to vector" #f #f]{
Examples: @zi[􏻿]
}

@section{􏻿 􏻽 􏻼, 􏻿? 􏻽? 􏻼?, 􏻸?}

@defideogr[􏻿 (矢LB 十) "vector, introduce a vector data type" #f #f]{
@zi[十] here specifically means @italic{a few of fixed length of elements}.
}
@defideogr[(􏻿B 􏻿BR) (􏻿 (B BR)) "vector resemblance" #f #f]{
Examples: @zi[􏻸] @zi[􏻼] @zi[􏻺] @zi[􏻻] @zi[􏻹]
}

@defideogr[􏻿PFX (􏻿 PFX) "process vector" #f #f]{
Implies the type of input data is @zi[􏻿], and how to process this data thus the output are both denpending on the suffix.
@ziexamples[􏻿巨 􏻿弔 􏻿弔]
}

@defideogr[(􏻼 􏻽) ((𭕄  山) 􏻿BR) "immutable or mutable vector" #f #f]
@defideogr[􏻸 (穴 􏻿B) "empty vector" #f #f]
@examples[#:eval (the-eval)
(􏻽 1 2 3 4)
(􏻽? (􏻽 1 2 3 4))

(􏻼 1 2 3 4)
(􏻼? (􏻼 1 2 3 4))

(􏻽? (􏻿 1 2 3 4))
(􏻼? '#(1 2 3 4))

(􏻿? (􏻿 1 2 3 4))
(􏻿? (􏻽 1 2 3 4))
(􏻿? (􏻼 1 2 3 4))

(􏻸? (􏻿))
(􏻸? #())
]

@section{􏻺 􏻻 􏻹}
@eleph-note{@racket[􏼓] @racket[􏼎] @racket[􏿝]}
@defideogr[(􏻺 􏻻 􏻹) ((三 弓 毌) 􏻿BR) #f #f #f]
@examples[#:eval (the-eval)
(􏻺 5 'foo)
(􏻻 5 􏽊)
(􏻹 '#(1) '#(2) '#(3) '#(4))
]

@section{􏻿巨, 􏻿弔, 􏻿𠆯 􏻿􏽒}
@eleph-note{@racket[巨] @racket[弔] @racket[𠆯]}
@examples[#:eval (the-eval)
(􏻿巨 '#(1 2 3 4))
(􏻿弔 '#(a b c d) 2)
(􏻿𠆯 '#(1 222 35 4) <)
(􏻿􏽒 (􏻿 1 222 35 4) <)
]

@section{􏻼化, 􏻿化􏿴 􏿴化􏻿 􏻿􏾝化並}
@eleph-note{@racket[􏻼] @racket[􏻿􏾝]  @;、@racket[􏻿化􏸼]
}
@; @margin-note{另见：@racket[􏻿􏾝化􏸼*]}
@examples[#:eval (the-eval)
(􏻼化 '#(a b c d))
(􏿴化􏻿 '(a b c d))
(􏻿化􏿴 '#(a b c d))
(􏻿􏾝化並 '#(a b c d) 0 2)
]

@section{􏻿􏾺 􏻿􏷵 􏻿􏸄 􏻿􏾝}
@eleph-note{@racket[􏾺] @racket[􏸄] @racket[􏾝]}
@; @margin-note{另见：@racket[􏻿􏾝*]}

@examples[#:eval (the-eval)
(􏻿􏾺 '#(a b c d e f) 2)
(􏻿􏷵 '#(a b c d e f) 2)
(􏻿􏸄 '#(a b c d e f) 2)
(􏻿􏾝 '#(a b c d e f) 0 2)
]

@section{􏻿弓, 􏻿􏷑 􏻿􏷉, 􏻿􏹈 􏻿􏹇}
@eleph-note{@racket[弓] @racket[􏷑] @racket[􏹇]}
@examples[#:eval (the-eval)
(􏻿弓 'c '#(a b 1 c 2 d 3 e))
(􏻿􏷑 􏽊 '#(1 2 3 4))
(􏻿􏹈 􏻛? '#(1 2 -3 4))
(􏻿􏹇 􏻛? '#(1 2 -3 4))

(名 vec (􏻿 1 2 3 4))
(􏻿􏷉 􏽊 vec)
vec
]

@section{􏻿􏾩 􏻿𢪛, 􏻺𰅡, 􏻿𢪛/以􏾝}
@eleph-note{@racket[􏾝] @racket[攸]}
@eleph-note{@racket[􏻿􏾝] @;、@racket[􏻿􏾩/以􏾝*]
}
@examples[#:eval (the-eval)
(名 vec (􏻿 'a 'b 'c 'd))
vec
(􏻿􏾩 vec 1 'x)
vec
(􏻿𢪛 vec 1 'h 2 'i 3 'j)
vec
(􏻺𰅡 vec 'z)
vec
(􏻿𢪛/以􏾝 vec 0 '#(aa bb cc dd) 1 3)
vec
]

@section[#:tag "vector-base"]{ming/racket/base}
@defmodule[ming/racket/base]
@defmapping[racket/base/vector]

@section[#:tag "vector-additional"]{ming/racket/vector}
@defmodule[ming/racket/vector]
@defmapping[racket/vector]
