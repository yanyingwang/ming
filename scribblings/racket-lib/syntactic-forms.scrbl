#lang scribble/manual

@(require (for-label racket ming ming/list)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/list ming/racket/vector ming/list)))

@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "syntactic-forms"]{语法形式}


@section+elemref{并、戈}
@margin-note{
@bold{@litchar{并}为原意字} @linebreak{}
@bold{@litchar{戈}为活用字} @linebreak{}
@itemlist[
@item{@litchar{戈}：shorts for @litchar{或}, in modern chinese which means "or".}
]
}
@examples[#:eval (the-eval)
(并 3 2)
(戈 3 2)
(并 (< 2 5) (> 2 0))
(戈 (< 2 5) (> 2 0))
]


@defmapping[racket/base/syntactic-forms]
