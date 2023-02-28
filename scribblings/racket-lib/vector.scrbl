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

@section+elemref{􏿲、􏿲/坚，复􏿲、序􏿲，毌􏿲，空􏿲?、􏿲?}
“􏿲”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "vector"]）是和“@racket[􏿴]”类似的一种数据结构，但显著的一个不同是访问和更新其元素值的时间复杂度是@hyperlink["https://zh.wikipedia.org/wiki/%E5%B8%B8%E6%95%B8%E6%99%82%E9%96%93" "常数时间"]。

@margin-note{
@bold{@litchar{􏿲}为新造字}
@itemlist[
@item{该字中的偏旁@litchar{矢}是“矢量”（vector）的意思；}
@item{偏旁@litchar{矢}呈现为半包围结构，表示其所代表的数据也是一种类似@racket[􏿴]一样的链状结构。}
]
}

@examples[#:eval (the-eval)
(􏿲 1 2 3 4)
(􏿲? (􏿲 1 2 3 4))
(坚? (􏿲 1 2 3 4))
(􏿲/坚 1 2 3 4)
(􏿲? (􏿲/坚 1 2 3 4))
(坚? (􏿲/坚 1 2 3 4))

(复􏿲 5 'foo)
(序􏿲 5 殖)

(毌􏿲 '#(1) '#(2) '#(3) '#(4))

(空􏿲? '#())
]


@section+elemref{􏿲度、􏿲第、􏿲𠍣}
@examples[#:eval (the-eval)
(􏿲度 '#(1 2 3 4))
(􏿲第 '#(a b c d) 2)
(􏿲𠍣 '#(1 222 35 4) <)
]


@section+elemref{􏿴->􏿲，􏿲->􏿲/坚，􏿲->􏿴，􏿲->殖}
@examples[#:eval (the-eval)
(􏿴->􏿲 '(a b c d))
(􏿲->􏿴 '#(a b c d))
(􏿲->􏿲/坚 '#(a b c d))
(􏿲->殖 '#(a b c d))
(􏿲->殖 '#(a b c d) 0 2)
]


@section+elemref{􏿲攸!、􏿲覆!、􏿲覆!/以它段}
@examples[#:eval (the-eval)
(令 ([某􏿲 (􏿲 'a 'b 'c 'd)])
  (􏿲攸! 某􏿲 2 'x)
  某􏿲)

(令 ([某􏿲 (􏿲 'a 'b 'c 'd)])
  (􏿲覆! 某􏿲 'x)
  某􏿲)

(令 ([某􏿲 (􏿲 'a 'b 'c 'd)])
  (􏿲覆!/以它段 某􏿲 0 '#(aa bb cc dd) 1 3)
  某􏿲)
]


@section+elemref{􏿲􏾺、􏿲􏾹、􏿲􏾺分、􏿲部}
@examples[#:eval (the-eval)
(􏿲􏾺 '#(a b c d e f) 2)
(􏿲􏾹 '#(a b c d e f) 2)
(􏿲􏾺分 '#(a b c d e f) 2)
(􏿲部 '#(a b c d e f) 2 5)
]

@section+elemref{􏿲𬩽，􏿲𮞑，􏿲􏾽，􏿲􏾼}
@examples[#:eval (the-eval)
(􏿲𬩽 'c '#(a b 1 c 2 d 3 e))

(􏿲𮞑 加一 '#(1 2 3 4))

(􏿲􏾽 正数? '#(1 2 -3 4))
(􏿲􏾼 正数? '#(1 2 -3 4))
]



@section[#:tag "vector-base"]{基础例程}
@defmapping[
racket/base/vector
]


@section[#:tag "vector-additional"]{额外例程}
@defmodule[ming/racket/vector]
@defmapping[racket/vector]
