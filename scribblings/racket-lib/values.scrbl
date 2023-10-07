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
Racket's @tech[#:doc '(lib "scribblings/reference/reference.scrbl") "value"] is especially called @elemref["𰅰"]{𰅰} in ming-lang.

Racket's @secref["values" #:doc '(lib "scribblings/reference/reference.scrbl")] is especially called @elemref["並"]{並} in ming-lang.

@elemref["并"]{并}

@section+autotag{𰅰，並，𡌶}
@像注{@racket[􏸾]、@racket[􏸽]}
@itemlist[
@item{
@defzi["𰅰"]{simplifies from @litchar{值}, which means @elucidate{value} in modern chinese.}
}
@item{
@defzi["並"]{simplifies from @litchar{竝} in ancient chinese, means @elucidate{two or more than two objects as a whole}. (Not confuse with @racket[并])}
}
]
@examples[#:eval (the-eval)
(並 1 2 3 4)
(𡌶 􏿴 (􏸧 (並 1 2 3 4)))
]


@section[#:tag "base-values"]{References}
@defmodule[ming/racket/base]
@defmapping[racket/base/values]

