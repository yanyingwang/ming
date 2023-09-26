#lang scribble/manual

@(require (for-label racket ming ming/list)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base)))


@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*

@title[#:tag "characters"]{字}


@section+elemref{字，字?}
“字”（@tech[#:doc '(lib "scribblings/reference/reference.scrbl") "characters"]）就是通常所谓的“字符”。



@section[#:tag "character-base"]{例程}
@defmodule[ming/racket/base]
@defmapping[racket/base/characters]
