#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base)))

@(require (file "../../private/scribble-styles/css/fonts.css.rkt"))
@css/wenquan-extend-font
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "box-weak-box-ephemeron"]{矢、䒨、􏾧}

@section+elemref{矢?，矢、矢/坚，􏾢、𥎪!}
“矢”可以被看成是只含有一个元素的@racket[􏿲]的数据结构。

@margin-note{
@bold{@litchar{矢}为活用字}
@itemlist[
@item{取自@racket[􏿲]的偏旁以表示是类似只含有一个元素的@racket[􏿲]的数据结构。}
]

@bold{@litchar{􏾢}为新造字}
@itemlist[
@item{意为返回@racket[矢]的内部值。}
]

@bold{@litchar{𥎪}为新造字}
@itemlist[
@item{意为修改@racket[矢]的内部值为一个新值。}
]
}

@examples[#:eval (the-eval)
(矢/坚 "val")
(坚? (矢/坚 "val"))
(矢 "val")
(􏾢 (矢 "val"))
(令 ([某 (矢 "val")])
  (𥎪! 某 "value")
  某
)
]

@section+elemref{䒨?、䒨、􏾡}
“䒨”（@secref["weakbox" #:doc '(lib "scribblings/reference/reference.scrbl")]）是类似@racket[矢]的一种数据结构，不过采用@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "weak references"]。

@margin-note{
@bold{@litchar{䒨}是古活字}
@itemlist[
@item{偏旁@litchar{艹}代表“草”，是“柔”（@secref["weakbox" #:doc '(lib "scribblings/reference/reference.scrbl")]）的意思，因为草是柔软的（与之相反地是“𥫗”）。}
@item{整体上是在@racket[矢]的基础上增加了偏旁，因为是与之类似的数据结构。}

]

@bold{@litchar{􏾡}为新造字}
@itemlist[
@item{意为返回@racket[䒨]的内部值。}
]
}

@examples[#:eval (the-eval)
(䒨 "val")
(􏾡 (䒨 "val"))
]



@section+elemref{􏾧?、􏾧、􏾠}
“􏾧”（@secref["ephemerons" #:doc '(lib "scribblings/reference/reference.scrbl")]）是类似@racket[䒨]的一种数据结构，不过是一种类似“键值对”的数据结构。

@margin-note{
@bold{@litchar{􏾧}是新造字}
@itemlist[
@item{整体上是在@racket[䒨]的基础上增加了偏旁@litchar{弓}。}
]
}

@examples[#:eval (the-eval)
(􏾧 'key "val")
(􏾠 (􏾧 'key "val"))
]

@section[#:tag "vector-base"]{例程}
@defmapping[
racket/base/box
]
