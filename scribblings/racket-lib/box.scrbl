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


@title[#:tag "box"]{矢}
“矢”是只有一个元素的@racket[􏿲]。


@section[#:tag "vector-base"]{基础例程}
@defmapping[
racket/base/box
]
