#lang scribble/manual

@(require (for-label racket ming ming/kernel)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/kernel)))

@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "ming-values"]{Multiple Values}
Racket's @tech[#:doc '(lib "scribblings/reference/reference.scrbl") "value"] is especially called @zi{𰅰} in ming-lang.

Racket's @secref["values" #:doc '(lib "scribblings/reference/reference.scrbl")] is especially called @zi{並} in ming-lang.

@elemref["并"]{并}

@section+autotag{𰅰，並，𡌶}
@eleph-note{@racket[􏸾]、@racket[􏸽]}
@itemlist[
@item{
@defzi["𰅰"]{@modernly-simplifies["值" "value"]}
}
@item{
@defzi["並"]{@anciently-simplifies["竝" "two or more than two objects as a whole" "multiple values"]{(Not confuse with @zi{并})}. }
}
]
@examples[#:eval (the-eval)
(並 1 2 3 4)
(𡌶 􏿴 (􏸧 (並 1 2 3 4)))
]


@section[#:tag "base-values"]{References}
@defmodule[ming/racket/base]
@defmapping[racket/base/values]



