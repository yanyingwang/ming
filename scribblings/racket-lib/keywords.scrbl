#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/keyword)))


@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*

@title[#:tag "keywords"]{􏶿}
Originates from @secref["keywords" #:doc '(lib "scribblings/reference/reference.scrbl")].

@section[#:tag "nameing-rules-of-keyword"]{Naming Rules}
@secref["naming-rules"]

@section{􏶿?，􏶿化句、句化􏶿、􏶿化􏽁}
@defideogr[􏶿 "keyword" "􏷂" "spoon"]{
Resembles @zi[􏷂], because they are similar in data struct sence.
}
@examples[#:eval (the-eval)
(􏶿? '#:keyword)
(􏶿化句 '#:keyword)
(􏶿化􏽁 '#:keyword)
(句化􏶿 "string")
]



@section[#:tag "symbols-base"]{ming/racket/base}
@defmodule[ming/racket/base]
@defmapping[racket/base/keywords]

@section[#:tag "symbols-additional"]{ming/racket/keyword}
@defmodule[ming/racket/keyword]
@defmapping[racket/keyword]
